@interface AVTGroupPickerItem
- (AVTGroupPickerItem)initWithLocalizedName:(id)a3 symbolNameProvider:(id)a4;
- (NSString)localizedName;
- (id)symbolNameProvider;
@end

@implementation AVTGroupPickerItem

- (AVTGroupPickerItem)initWithLocalizedName:(id)a3 symbolNameProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AVTGroupPickerItem;
  v9 = [(AVTGroupPickerItem *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_localizedName, a3);
    uint64_t v11 = MEMORY[0x210530210](v8);
    id symbolNameProvider = v10->_symbolNameProvider;
    v10->_id symbolNameProvider = (id)v11;
  }
  return v10;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (id)symbolNameProvider
{
  return self->_symbolNameProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_symbolNameProvider, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
}

@end