@interface IMBackpressuredDonationController
- (BOOL)donationInProgress;
- (IMBackpressuredDonationController)initWithDonationCount:(int64_t)a3 maxBackpressureSize:(int64_t)a4 donationBlock:(id)a5;
- (NSMutableArray)pendingDonations;
- (OS_dispatch_queue)queue;
- (id)_popDonationsUpToCount:(int64_t)a3;
- (id)donationBlock;
- (int64_t)donationCount;
- (int64_t)maxBackpressureSize;
- (void)_beganDonatingItems;
- (void)_deferItems:(id)a3;
- (void)_donateItems:(id)a3;
- (void)_finishedDonatingItems:(id)a3;
- (void)donateItems:(id)a3;
- (void)setDonationBlock:(id)a3;
- (void)setDonationInProgress:(BOOL)a3;
- (void)setPendingDonations:(id)a3;
@end

@implementation IMBackpressuredDonationController

- (IMBackpressuredDonationController)initWithDonationCount:(int64_t)a3 maxBackpressureSize:(int64_t)a4 donationBlock:(id)a5
{
  id v8 = a5;
  v19.receiver = self;
  v19.super_class = (Class)IMBackpressuredDonationController;
  v9 = [(IMBackpressuredDonationController *)&v19 init];
  v10 = v9;
  if (v9)
  {
    v9->_donationCount = a3;
    v9->_maxBackpressureSize = a4;
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.IMDPersistence.BackpressuredDonation", v11);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v12;

    v14 = _Block_copy(v8);
    id donationBlock = v10->_donationBlock;
    v10->_id donationBlock = v14;

    v10->_donationInProgress = 0;
    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pendingDonations = v10->_pendingDonations;
    v10->_pendingDonations = v16;
  }
  return v10;
}

- (void)_beganDonatingItems
{
}

- (id)_popDonationsUpToCount:(int64_t)a3
{
  v5 = [(IMBackpressuredDonationController *)self pendingDonations];
  if ([v5 count] <= (unint64_t)a3)
  {
    v6 = [(IMBackpressuredDonationController *)self pendingDonations];
    a3 = [v6 count];
  }
  v7 = [(IMBackpressuredDonationController *)self pendingDonations];
  id v8 = objc_msgSend(v7, "subarrayWithRange:", 0, a3);

  v9 = [(IMBackpressuredDonationController *)self pendingDonations];
  objc_msgSend(v9, "removeObjectsInRange:", 0, a3);

  return v8;
}

- (void)_finishedDonatingItems:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v13 = 134217984;
      uint64_t v14 = [v4 count];
      _os_log_impl(&dword_1AFB53000, v5, OS_LOG_TYPE_INFO, "Finished donating %llu interactions", (uint8_t *)&v13, 0xCu);
    }
  }
  [(IMBackpressuredDonationController *)self setDonationInProgress:0];
  v6 = [(IMBackpressuredDonationController *)self pendingDonations];
  BOOL v7 = [v6 count] == 0;

  if (!v7)
  {
    id v8 = [(IMBackpressuredDonationController *)self pendingDonations];
    uint64_t v9 = [v8 count];

    v10 = [(IMBackpressuredDonationController *)self _popDonationsUpToCount:[(IMBackpressuredDonationController *)self donationCount]];
    if (IMOSLoggingEnabled())
    {
      v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = [v10 count];
        int v13 = 134218240;
        uint64_t v14 = v9;
        __int16 v15 = 2048;
        uint64_t v16 = v12;
        _os_log_impl(&dword_1AFB53000, v11, OS_LOG_TYPE_INFO, "There are %llu interactions waiting to be donated, going to donate %llu more", (uint8_t *)&v13, 0x16u);
      }
    }
    [(IMBackpressuredDonationController *)self _donateItems:v10];
  }
}

- (void)_deferItems:(id)a3
{
  id v4 = a3;
  v5 = [(IMBackpressuredDonationController *)self pendingDonations];
  uint64_t v6 = [v5 count];
  uint64_t v7 = [v4 count] + v6;

  uint64_t v8 = v7 - [(IMBackpressuredDonationController *)self maxBackpressureSize];
  if (v8 >= 1)
  {
    uint64_t v9 = IMLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1AFC64AB4(v8, v9);
    }

    v10 = [(IMBackpressuredDonationController *)self pendingDonations];
    objc_msgSend(v10, "removeObjectsInRange:", 0, v8);
  }
  v11 = [(IMBackpressuredDonationController *)self pendingDonations];
  [v11 addObjectsFromArray:v4];
}

- (void)_donateItems:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(IMBackpressuredDonationController *)self donationInProgress])
  {
    if (IMOSLoggingEnabled())
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v17 = [v4 count];
        _os_log_impl(&dword_1AFB53000, v5, OS_LOG_TYPE_INFO, "Donation is in progress, deferring donation of %llu interactions", buf, 0xCu);
      }
    }
    [(IMBackpressuredDonationController *)self _deferItems:v4];
  }
  else
  {
    unint64_t v6 = [v4 count];
    if (v6 > [(IMBackpressuredDonationController *)self donationCount])
    {
      uint64_t v7 = objc_msgSend(v4, "subarrayWithRange:", -[IMBackpressuredDonationController donationCount](self, "donationCount"), objc_msgSend(v4, "count") - -[IMBackpressuredDonationController donationCount](self, "donationCount"));
      if (IMOSLoggingEnabled())
      {
        uint64_t v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134218496;
          uint64_t v17 = [v4 count];
          __int16 v18 = 2048;
          int64_t v19 = [(IMBackpressuredDonationController *)self donationCount];
          __int16 v20 = 2048;
          uint64_t v21 = [v7 count];
          _os_log_impl(&dword_1AFB53000, v8, OS_LOG_TYPE_INFO, "Received a request to index too many items (%llu > %llu), deferring %llu", buf, 0x20u);
        }
      }
      [(IMBackpressuredDonationController *)self _deferItems:v7];
      uint64_t v9 = objc_msgSend(v4, "subarrayWithRange:", 0, -[IMBackpressuredDonationController donationCount](self, "donationCount"));

      id v4 = (id)v9;
    }
    [(IMBackpressuredDonationController *)self _beganDonatingItems];
    if (IMOSLoggingEnabled())
    {
      v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = [v4 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v17 = v11;
        _os_log_impl(&dword_1AFB53000, v10, OS_LOG_TYPE_INFO, "Going to donate %llu interactions", buf, 0xCu);
      }
    }
    uint64_t v12 = [(IMBackpressuredDonationController *)self donationBlock];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_1AFB8E9FC;
    v13[3] = &unk_1E5F90778;
    id v4 = v4;
    id v14 = v4;
    __int16 v15 = self;
    ((void (**)(void, id, void *))v12)[2](v12, v4, v13);
  }
}

- (void)donateItems:(id)a3
{
  id v4 = a3;
  v5 = [(IMBackpressuredDonationController *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1AFB8EC74;
  v7[3] = &unk_1E5F8D508;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (int64_t)donationCount
{
  return self->_donationCount;
}

- (int64_t)maxBackpressureSize
{
  return self->_maxBackpressureSize;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (id)donationBlock
{
  return self->_donationBlock;
}

- (void)setDonationBlock:(id)a3
{
}

- (BOOL)donationInProgress
{
  return self->_donationInProgress;
}

- (void)setDonationInProgress:(BOOL)a3
{
  self->_donationInProgress = a3;
}

- (NSMutableArray)pendingDonations
{
  return self->_pendingDonations;
}

- (void)setPendingDonations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingDonations, 0);
  objc_storeStrong(&self->_donationBlock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end