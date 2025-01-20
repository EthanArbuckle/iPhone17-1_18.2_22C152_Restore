@interface VCStatisticsHistory
- (void)clearSendHistory;
- (void)dealloc;
@end

@implementation VCStatisticsHistory

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(VCStatisticsHistory *)self clearSendHistory];
  v3.receiver = self;
  v3.super_class = (Class)VCStatisticsHistory;
  [(VCStatisticsHistory *)&v3 dealloc];
}

- (void)clearSendHistory
{
  sendHistory = self->_sendHistory;
  if (sendHistory)
  {
    do
    {
      var5 = sendHistory->var5;
      free(sendHistory);
      sendHistory = var5;
    }
    while (var5);
  }
}

@end