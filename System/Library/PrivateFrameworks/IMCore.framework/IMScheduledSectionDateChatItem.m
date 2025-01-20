@interface IMScheduledSectionDateChatItem
- (IMScheduledSectionDateChatItem)initWithItem:(id)a3;
- (NSDate)date;
@end

@implementation IMScheduledSectionDateChatItem

- (IMScheduledSectionDateChatItem)initWithItem:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IMScheduledSectionDateChatItem;
  v8 = [(IMChatItem *)&v12 _initWithItem:v4];
  if (v8)
  {
    uint64_t v9 = objc_msgSend_time(v4, v5, v6, v7);
    date = v8->_date;
    v8->_date = (NSDate *)v9;
  }
  return v8;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
}

@end