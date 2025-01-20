@interface CLSCurationDebugItem
+ (id)stringForDedupingType:(unint64_t)a3;
- (CLSCurationDebugItem)initWithItem:(id)a3;
- (CLSCurationItem)item;
- (id)dictionaryRepresentation;
- (id)identifier;
- (id)timestamp;
- (void)dupeToDebugItem:(id)a3 withDedupingType:(unint64_t)a4;
- (void)setItem:(id)a3;
@end

@implementation CLSCurationDebugItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_dedupedDebugItem, 0);
}

- (void)setItem:(id)a3
{
}

- (CLSCurationItem)item
{
  return self->_item;
}

- (void)dupeToDebugItem:(id)a3 withDedupingType:(unint64_t)a4
{
  id v7 = a3;
  if ([(CLSCurationDebugObject *)self state] == 2)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Item is already rejected, can't dupe it", v8, 2u);
    }
  }
  else
  {
    self->_dedupingType = a4;
    objc_storeStrong((id *)&self->_dedupedDebugItem, a3);
  }
}

- (id)identifier
{
  return (id)[(CLSCurationItem *)self->_item clsIdentifier];
}

- (id)timestamp
{
  return (id)[(CLSCurationItem *)self->_item cls_universalDate];
}

- (id)dictionaryRepresentation
{
  v15.receiver = self;
  v15.super_class = (Class)CLSCurationDebugItem;
  v3 = [(CLSCurationDebugObject *)&v15 dictionaryRepresentation];
  v4 = (void *)[v3 mutableCopy];

  if (([(CLSCurationItem *)self->_item clsIsInterestingSDOF] & 1) != 0
    || [(CLSCurationItem *)self->_item clsIsInterestingHDR])
  {
    [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"isSDOFOrHDR"];
  }
  if ([(CLSCurationItem *)self->_item isFavorite]) {
    [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"isFavorite"];
  }
  if ([(CLSCurationItem *)self->_item clsIsUtility]) {
    [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"isUtility"];
  }
  if ([(CLSCurationItem *)self->_item clsIsBlurry]) {
    [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"isBlurry"];
  }
  v5 = (void *)MEMORY[0x1E4F28ED0];
  [(CLSCurationItem *)self->_item clsAestheticScore];
  v6 = objc_msgSend(v5, "numberWithDouble:");
  [v4 setObject:v6 forKeyedSubscript:@"aestheticScore"];

  id v7 = (void *)MEMORY[0x1E4F28ED0];
  [(CLSCurationItem *)self->_item clsContentScore];
  v8 = objc_msgSend(v7, "numberWithDouble:");
  [v4 setObject:v8 forKeyedSubscript:@"contentScore"];

  v9 = (void *)MEMORY[0x1E4F28ED0];
  [(CLSCurationItem *)self->_item clsIconicScore];
  v10 = objc_msgSend(v9, "numberWithDouble:");
  [v4 setObject:v10 forKeyedSubscript:@"iconicScore"];

  if (self->_dedupingType)
  {
    v11 = [(id)objc_opt_class() stringForDedupingType:self->_dedupingType];
    [v4 setObject:v11 forKeyedSubscript:@"dedupingType"];

    v12 = [(CLSCurationDebugItem *)self->_dedupedDebugItem item];
    v13 = [v12 clsIdentifier];
    [v4 setObject:v13 forKeyedSubscript:@"dedupedItemIdentifier"];
  }
  return v4;
}

- (CLSCurationDebugItem)initWithItem:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CLSCurationDebugItem;
  v6 = [(CLSCurationDebugObject *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_item, a3);
  }

  return v7;
}

+ (id)stringForDedupingType:(unint64_t)a3
{
  if (a3 > 5) {
    return @"Invalid Type";
  }
  else {
    return off_1E6910468[a3];
  }
}

@end