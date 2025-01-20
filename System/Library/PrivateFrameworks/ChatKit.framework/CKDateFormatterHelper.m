@interface CKDateFormatterHelper
+ (id)sharedInstance;
- (CKDateFormatterHelper)init;
- (NSArray)lockList;
- (NSCache)dateFormatterContainer;
- (id)_createDateFormatterFor:(int64_t)a3;
- (id)_createRelativeStandaloneDateFormatter;
- (id)_createShortDateNoTimeInSentenceDateFormatter;
- (id)_keyForDateFormatterType:(int64_t)a3;
- (id)_templateStringForFormatterType:(int64_t)a3;
- (id)getDateFormatterFor:(int64_t)a3;
- (void)removeAllObjects;
- (void)setDateFormatterContainer:(id)a3;
- (void)setLockList:(id)a3;
@end

@implementation CKDateFormatterHelper

- (NSArray)lockList
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__CKDateFormatterHelper_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_8 != -1) {
    dispatch_once(&sharedInstance_onceToken_8, block);
  }
  v2 = (void *)sharedInstance_sInstance_4;

  return v2;
}

void __39__CKDateFormatterHelper_sharedInstance__block_invoke()
{
  id v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance_sInstance_4;
  sharedInstance_sInstance_4 = (uint64_t)v0;
}

- (CKDateFormatterHelper)init
{
  v13.receiver = self;
  v13.super_class = (Class)CKDateFormatterHelper;
  v2 = [(CKDateFormatterHelper *)&v13 init];
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    dateFormatterContainer = v2->_dateFormatterContainer;
    v2->_dateFormatterContainer = v3;

    v5 = objc_opt_new();
    int v6 = 11;
    do
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F28FD0]);
      [v5 addObject:v7];

      --v6;
    }
    while (v6);
    uint64_t v8 = [v5 copy];
    lockList = v2->_lockList;
    v2->_lockList = (NSArray *)v8;

    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v2 selector:sel_removeAllObjects name:*MEMORY[0x1E4F43660] object:0];

    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v2 selector:sel_removeAllObjects name:*MEMORY[0x1E4F43670] object:0];
  }
  return v2;
}

- (id)getDateFormatterFor:(int64_t)a3
{
  v5 = -[CKDateFormatterHelper _keyForDateFormatterType:](self, "_keyForDateFormatterType:");
  int v6 = [(CKDateFormatterHelper *)self lockList];
  id v7 = [v6 objectAtIndexedSubscript:a3];

  [v7 lock];
  uint64_t v8 = [(CKDateFormatterHelper *)self dateFormatterContainer];
  v9 = [v8 objectForKey:v5];

  if (!v9)
  {
    v9 = [(CKDateFormatterHelper *)self _createDateFormatterFor:a3];
    v10 = [(CKDateFormatterHelper *)self dateFormatterContainer];
    [v10 setObject:v9 forKey:v5];
  }
  [v7 unlock];

  return v9;
}

- (id)_createDateFormatterFor:(int64_t)a3
{
  v5 = -[CKDateFormatterHelper _templateStringForFormatterType:](self, "_templateStringForFormatterType:");
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 9:
      int v6 = CKAutoupdatingDateFormatter;
      goto LABEL_4;
    case 6:
    case 7:
      int v6 = CKAutoupdatingRelativeDateFormatter;
LABEL_4:
      uint64_t v7 = [[v6 alloc] initWithTemplate:v5];
      goto LABEL_5;
    case 8:
      uint64_t v7 = [(CKDateFormatterHelper *)self _createShortDateNoTimeInSentenceDateFormatter];
      goto LABEL_5;
    case 10:
      uint64_t v7 = [(CKDateFormatterHelper *)self _createRelativeStandaloneDateFormatter];
LABEL_5:
      uint64_t v8 = (void *)v7;
      break;
    default:
      uint64_t v8 = 0;
      break;
  }

  return v8;
}

- (id)_createShortDateNoTimeInSentenceDateFormatter
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v3 = objc_msgSend(MEMORY[0x1E4F1CA20], "__ck_currentLocale");
  [v2 setLocale:v3];

  [v2 setTimeStyle:0];
  [v2 setDateStyle:1];
  [v2 setFormattingContext:5];

  return v2;
}

- (id)_createRelativeStandaloneDateFormatter
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v2 setTimeStyle:0];
  [v2 setDateStyle:1];
  v3 = objc_msgSend(MEMORY[0x1E4F1CA20], "__ck_currentLocale");
  [v2 setLocale:v3];

  [v2 setDoesRelativeDateFormatting:1];
  [v2 setFormattingContext:2];

  return v2;
}

- (id)_keyForDateFormatterType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xA) {
    return @"kThePastDateFormatterKey";
  }
  else {
    return off_1E562BBB0[a3 - 1];
  }
}

- (id)_templateStringForFormatterType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xA) {
    return @"yMMMdjm";
  }
  else {
    return off_1E562BC08[a3 - 1];
  }
}

- (void)removeAllObjects
{
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Clean up date formatter objects", v5, 2u);
    }
  }
  v4 = [(CKDateFormatterHelper *)self dateFormatterContainer];
  [v4 removeAllObjects];
}

- (NSCache)dateFormatterContainer
{
  return (NSCache *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDateFormatterContainer:(id)a3
{
}

- (void)setLockList:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockList, 0);

  objc_storeStrong((id *)&self->_dateFormatterContainer, 0);
}

@end