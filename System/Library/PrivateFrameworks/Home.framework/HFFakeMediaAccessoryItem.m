@interface HFFakeMediaAccessoryItem
- (HFFakeMediaAccessoryItem)initWithMediaAccessoryItemType:(int64_t)a3;
- (id)_subclass_updateWithOptions:(id)a3;
- (id)createControlItemsWithOptions:(id)a3;
- (id)description;
- (int64_t)mediaAccessoryItemType;
- (void)setMediaAccessoryItemType:(int64_t)a3;
@end

@implementation HFFakeMediaAccessoryItem

- (HFFakeMediaAccessoryItem)initWithMediaAccessoryItemType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HFFakeMediaAccessoryItem;
  result = [(HFFakeMediaAccessoryItem *)&v5 init];
  if (result) {
    result->_mediaAccessoryItemType = a3;
  }
  return result;
}

- (id)description
{
  v2 = NSString;
  v3 = HFMediaAccessoryItemTypeDescription([(HFFakeMediaAccessoryItem *)self mediaAccessoryItemType]);
  v4 = [v2 stringWithFormat:@"Fake %@", v3];

  return v4;
}

- (id)createControlItemsWithOptions:(id)a3
{
  v3 = objc_opt_new();
  return v3;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v3 = objc_alloc_init(HFMutableItemUpdateOutcome);
  v4 = [MEMORY[0x263EFF9D0] null];
  [(HFMutableItemUpdateOutcome *)v3 setObject:v4 forKeyedSubscript:@"HFResultMediaRouteIdentifierKey"];

  objc_super v5 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v5;
}

- (int64_t)mediaAccessoryItemType
{
  return self->_mediaAccessoryItemType;
}

- (void)setMediaAccessoryItemType:(int64_t)a3
{
  self->_mediaAccessoryItemType = a3;
}

@end