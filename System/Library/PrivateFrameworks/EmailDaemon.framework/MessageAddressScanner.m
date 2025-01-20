@interface MessageAddressScanner
+ (id)coreRecentsMetadataForMessage:(id)a3;
+ (id)sharedInstance;
+ (id)weightForMessage:(id)a3 addressBook:(void *)a4 vipManager:(id)a5;
- (MFMailMessageLibrary)library;
- (MessageAddressScanner)init;
- (__DDScanner)scanner;
- (id)recentsLibrary;
- (void)_addAddressDetectorResult:(__DDResult *)a3 forMessage:(id)a4;
- (void)_messagesFlagsChanged:(id)a3;
- (void)_messagesWereCompacted:(id)a3;
- (void)_messagesWillBeCompacted:(id)a3;
- (void)_scheduleRemovalOfDetectedAddressesInMessages:(id)a3;
- (void)addressBook;
- (void)dealloc;
- (void)handleAddressBookChange;
- (void)scanSummary:(id)a3 forMessage:(id)a4;
- (void)setLibrary:(id)a3;
@end

@implementation MessageAddressScanner

+ (id)coreRecentsMetadataForMessage:(id)a3
{
  id v3 = a3;
  id v4 = [v3 firstSender];
  v5 = [v4 emailAddressValue];
  v6 = [v5 simpleAddress];
  v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [v4 stringValue];
  }
  v9 = v8;

  id v10 = v4;
  v11 = [v10 emailAddressValue];
  v12 = [v11 displayName];
  v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    id v14 = [v10 stringValue];
  }
  v15 = v14;

  if ([v15 isEqualToString:v9])
  {

    v15 = 0;
  }
  if (v9)
  {
    id v31 = v3;
    v16 = +[NSMutableDictionary dictionary];
    v17 = off_100169CC0[0]();
    [v16 setObject:v9 forKeyedSubscript:v17];

    v18 = off_100169CC8[0]();
    v19 = off_100169CD0[0]();
    [v16 setObject:v18 forKeyedSubscript:v19];

    if ([v15 length])
    {
      v20 = off_100169CD8[0]();
      [v16 setObject:v15 forKeyedSubscript:v20];
    }
    v21 = +[NSMutableDictionary dictionary];
    v22 = off_100169CE0[0]();
    [v21 setObject:v16 forKeyedSubscript:v22];

    v23 = [v3 subject];
    v24 = [v23 subjectWithoutPrefix];

    if ([v24 length])
    {
      v25 = off_100169CE8[0]();
      [v21 setObject:v24 forKeyedSubscript:v25];
    }
    v26 = [v3 globalMessageURL];
    v27 = v26;
    if (v26)
    {
      v28 = [v26 absoluteString];
      v29 = off_100169CB8[0]();
      [v21 setObject:v28 forKeyedSubscript:v29];
    }
    id v3 = v31;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

+ (id)weightForMessage:(id)a3 addressBook:(void *)a4 vipManager:(id)a5
{
  id v7 = a5;
  id v8 = [a3 firstSender];
  v9 = [v8 emailAddressValue];
  id v10 = [v9 simpleAddress];
  v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [v8 stringValue];
  }
  v13 = v12;

  if (!v13)
  {
    v15 = 0;
    goto LABEL_14;
  }
  id v14 = [v7 allVIPEmailAddresses];
  if (([v14 containsObject:v13] & 1) == 0)
  {
    if (a4)
    {
      uint64_t PersonMatchingEmailAddress = ABAddressBookFindPersonMatchingEmailAddress();

      if (PersonMatchingEmailAddress) {
        goto LABEL_10;
      }
    }
    else
    {
    }
    v17 = off_100169CF8;
    goto LABEL_13;
  }

LABEL_10:
  v17 = off_100169CF0;
LABEL_13:
  v15 = +[NSNumber numberWithInteger:(uint64_t)((double (__cdecl *)())*v17)()];
LABEL_14:

  return v15;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100040934;
  block[3] = &unk_100139B30;
  block[4] = a1;
  if (qword_10016B8E0 != -1) {
    dispatch_once(&qword_10016B8E0, block);
  }
  v2 = (void *)qword_10016B8D8;

  return v2;
}

- (MessageAddressScanner)init
{
  v8.receiver = self;
  v8.super_class = (Class)MessageAddressScanner;
  v2 = [(MessageAddressScanner *)&v8 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v4 = dispatch_queue_create("MessageAddressScanner", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = v2;
  }

  return v2;
}

- (void)dealloc
{
  ab = self->_ab;
  if (ab)
  {
    v8[0] = 0;
    v8[1] = v8;
    v8[2] = 0x2020000000;
    v8[3] = self;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100040B2C;
    v7[3] = &unk_10013B050;
    v7[4] = v8;
    v7[5] = ab;
    dispatch_queue_t v4 = +[EFScheduler mainThreadScheduler];
    [v4 performBlock:v7];

    _Block_object_dispose(v8, 8);
  }
  scanner = self->_scanner;
  if (scanner) {
    CFRelease(scanner);
  }
  v6.receiver = self;
  v6.super_class = (Class)MessageAddressScanner;
  [(MessageAddressScanner *)&v6 dealloc];
}

- (void)_scheduleRemovalOfDetectedAddressesInMessages:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_pendingRemovalQueue)
  {
    v5 = objc_alloc_init(_MessageAddressScannerQueue);
    pendingRemovalQueue = self->_pendingRemovalQueue;
    self->_pendingRemovalQueue = v5;

    id v7 = self->_pendingRemovalQueue;
    objc_super v8 = [(MessageAddressScanner *)self recentsLibrary];
    [(_MessageAddressScannerQueue *)v7 setRecentsLibrary:v8];

    [(_MessageAddressScannerQueue *)self->_pendingRemovalQueue setTargetQueue:self->_queue];
  }
  if ((*((unsigned char *)self + 40) & 1) == 0)
  {
    *((unsigned char *)self + 40) |= 1u;
    dispatch_time_t v9 = dispatch_time(0, 2000000000);
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100040DA4;
    block[3] = &unk_100139C48;
    block[4] = self;
    dispatch_after(v9, queue, block);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v11 = v4;
  id v12 = [v11 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v17;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v11);
        }
        id v15 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "messageIDHash", (void)v16);
        if (v15) {
          [(_MessageAddressScannerQueue *)self->_pendingRemovalQueue addHash:v15];
        }
      }
      id v12 = [v11 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v12);
  }
}

- (id)recentsLibrary
{
  Class v2 = (Class)off_100169D00[0]();

  return [(objc_class *)v2 defaultInstance];
}

- (__DDScanner)scanner
{
  result = (__DDScanner *)atomic_load((unint64_t *)&self->_scanner);
  if (!result)
  {
    id v4 = (const void *)DDScannerCreate();
    if (v4)
    {
      uint64_t v5 = 0;
      atomic_compare_exchange_strong((atomic_ullong *volatile)&self->_scanner, (unint64_t *)&v5, (unint64_t)v4);
      if (v5) {
        CFRelease(v4);
      }
    }
    else
    {
      objc_super v6 = MFLogGeneral();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "#Warning failed to create scanner: %@", buf, 0xCu);
      }
    }
    return self->_scanner;
  }
  return result;
}

- (void)addressBook
{
  if (!atomic_load((unint64_t *)&self->_ab))
  {
    ABAddressBookRef v5 = ABAddressBookCreateWithOptions(0, 0);
    if (v5)
    {
      uint64_t v6 = 0;
      atomic_compare_exchange_strong((atomic_ullong *volatile)&self->_ab, (unint64_t *)&v6, (unint64_t)v5);
      if (v6)
      {
        CFRelease(v5);
      }
      else
      {
        id v7 = +[EFScheduler mainThreadScheduler];
        [v7 performBlock:&v8];
      }
    }
  }
  return self->_ab;
}

- (void)setLibrary:(id)a3
{
  ABAddressBookRef v5 = (MFMailMessageLibrary *)a3;
  p_library = &self->_library;
  if (self->_library != v5)
  {
    dispatch_time_t v9 = v5;
    id v7 = +[NSNotificationCenter defaultCenter];
    uint64_t v8 = v7;
    if (*p_library)
    {
      objc_msgSend(v7, "removeObserver:name:object:", self, MailMessageStoreMessageFlagsChanged);
      [v8 removeObserver:self name:MailMessageStoreMessagesWillBeCompacted object:self->_library];
      [v8 removeObserver:self name:MailMessageStoreMessagesCompacted object:self->_library];
    }
    objc_storeStrong((id *)&self->_library, a3);
    if (*p_library)
    {
      objc_msgSend(v8, "addObserver:selector:name:object:", self, "_messagesFlagsChanged:", MailMessageStoreMessageFlagsChanged);
      [v8 addObserver:self selector:"_messagesWillBeCompacted:" name:MailMessageStoreMessagesWillBeCompacted object:self->_library];
      [v8 addObserver:self selector:"_messagesWereCompacted:" name:MailMessageStoreMessagesCompacted object:self->_library];
    }

    ABAddressBookRef v5 = v9;
  }
}

- (void)_messagesFlagsChanged:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100041200;
  v7[3] = &unk_100139C20;
  id v8 = v4;
  dispatch_time_t v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_messagesWillBeCompacted:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000413A0;
  v7[3] = &unk_100139C20;
  id v8 = v4;
  dispatch_time_t v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_messagesWereCompacted:(id)a3
{
}

- (void)handleAddressBookChange
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000414AC;
  block[3] = &unk_100139C48;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)scanSummary:(id)a3 forMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MessageAddressScanner *)self scanner];
  if (v8)
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000415E0;
    block[3] = &unk_10013B078;
    id v12 = v7;
    CFAbsoluteTime v15 = Current;
    long long v16 = v8;
    id v13 = v6;
    id v14 = self;
    dispatch_async(queue, block);
  }
}

- (void)_addAddressDetectorResult:(__DDResult *)a3 forMessage:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v6 = DDResultGetMatchedString();
  id v7 = [(id)objc_opt_class() coreRecentsMetadataForMessage:v5];
  id v8 = [(MessageAddressScanner *)self library];
  dispatch_time_t v9 = [v8 persistence];
  id v10 = [v9 vipManager];

  id v11 = objc_msgSend((id)objc_opt_class(), "weightForMessage:addressBook:vipManager:", v5, -[MessageAddressScanner addressBook](self, "addressBook"), v10);
  if (v11 && v7)
  {
    Class v12 = (Class)off_100169D00[0]();
    id v13 = off_100169D08();
    id v14 = [v5 dateReceived];
    CFAbsoluteTime v15 = [(objc_class *)v12 recentEventForAddress:v6 displayName:0 kind:v13 date:v14 weight:v11 metadata:v7 options:0];

    if (v15)
    {
      long long v16 = [(MessageAddressScanner *)self recentsLibrary];
      long long v19 = v15;
      long long v17 = +[NSArray arrayWithObjects:&v19 count:1];
      long long v18 = off_100169CB0[0]();
      [v16 recordContactEvents:v17 recentsDomain:v18 sendingAddress:0 completion:0];
    }
  }
}

- (MFMailMessageLibrary)library
{
  return self->_library;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_pendingRemovalQueue, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end