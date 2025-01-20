@interface CKSendLaterPluginInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)showingDatePicker;
- (CKSendLaterPluginInfo)init;
- (CKSendLaterPluginInfo)initWithCoder:(id)a3;
- (CKSendLaterPluginInfo)initWithConversation:(id)a3;
- (CKSendLaterPluginInfo)initWithSelectedDate:(id)a3;
- (NSDate)selectedDate;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setSelectedDate:(id)a3;
- (void)setShowingDatePicker:(BOOL)a3;
@end

@implementation CKSendLaterPluginInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDate)selectedDate
{
  uint64_t v3 = sub_18F7B61D0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](*(Class *)((char *)&self->super.isa + OBJC_IVAR___CKSendLaterPluginInfo__selectedDate));
  v8 = (char *)&v13 - v7;
  sub_18F7B6190();
  v9 = self;
  sub_18F74CB18((uint64_t)v6);
  v10 = *(void (**)(char *, uint64_t))(v4 + 8);
  v10(v8, v3);

  v11 = (void *)sub_18F7B6130();
  v10(v6, v3);

  return (NSDate *)v11;
}

- (void)setSelectedDate:(id)a3
{
  uint64_t v4 = sub_18F7B61D0();
  MEMORY[0x1F4188790](v4 - 8);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18F7B6190();
  uint64_t v7 = self;
  sub_18F74C4E4(v6);
}

- (BOOL)showingDatePicker
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___CKSendLaterPluginInfo_showingDatePicker);
}

- (void)setShowingDatePicker:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___CKSendLaterPluginInfo_showingDatePicker) = a3;
  uint64_t v3 = self;
  sub_18F74D000();
}

- (CKSendLaterPluginInfo)initWithSelectedDate:(id)a3
{
  uint64_t v3 = sub_18F7B61D0();
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18F7B6190();
  return (CKSendLaterPluginInfo *)sub_18F74D3A4(v5);
}

- (CKSendLaterPluginInfo)initWithConversation:(id)a3
{
  return (CKSendLaterPluginInfo *)sub_18F74E710(a3);
}

- (CKSendLaterPluginInfo)init
{
  return (CKSendLaterPluginInfo *)sub_18F74EE8C();
}

- (CKSendLaterPluginInfo)initWithCoder:(id)a3
{
  return (CKSendLaterPluginInfo *)CKSendLaterPluginInfo.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CKSendLaterPluginInfo__selectedDate);
  id v5 = a3;
  v6 = self;
  id v7 = v4;
  id v8 = (id)sub_18F7B97A0();
  objc_msgSend(v5, sel_encodeObject_forKey_, v7, v8);
}

- (void)dealloc
{
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CKSendLaterPluginInfo_updateTimer);
  uint64_t v4 = self;
  if (v3) {
    objc_msgSend(v3, sel_invalidate);
  }
  v5.receiver = self;
  v5.super_class = (Class)CKSendLaterPluginInfo;
  [(CKSendLaterPluginInfo *)&v5 dealloc];
}

- (void).cxx_destruct
{
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CKSendLaterPluginInfo__selectedDate);
}

- (void)addObserver:(id)a3
{
}

@end