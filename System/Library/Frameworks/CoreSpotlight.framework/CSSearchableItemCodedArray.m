@interface CSSearchableItemCodedArray
- ($917DE44C1CB612B85CED1B4C2573F471)obj;
- (CSDecoder)items;
- (CSDecoder)itemsContent;
- (CSSearchableItemCodedArray)initWithItems:(id)a3;
- (CSSearchableItemCodedArray)initWithItems:(id)a3 itemsContent:(id)a4;
- (NSString)bundleID;
- (NSString)protectionClass;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (void)setBundleID:(id)a3;
- (void)setProtectionClass:(id)a3;
@end

@implementation CSSearchableItemCodedArray

- (id)objectAtIndex:(unint64_t)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v22 = 0uLL;
  uint64_t v23 = 0;
  items = self->_items;
  if (items)
  {
    [(CSDecoder *)items obj];
  }
  else
  {
    uint64_t v19 = 0;
    uint64_t v20 = 0;
    uint64_t v21 = 0;
  }
  _MDPlistArrayGetPlistObjectAtIndex();
  v5 = [CSSearchableItemAttributeSet alloc];
  v6 = self->_items;
  long long v24 = v22;
  uint64_t v25 = v23;
  v7 = [(CSSearchableItemAttributeSet *)v5 initWithDecoder:v6 obj:&v24];
  if (self->_itemsContent)
  {
    bzero(&v24, 0x1000uLL);
    v8 = [(CSSearchableItemAttributeSet *)v7 uniqueIdentifier];
    int v9 = [v8 getCString:&v24 maxLength:4096 encoding:4];

    if (v9)
    {
      long long v17 = 0uLL;
      $37FF168C8709F524D812460C59637AB1 v18 = 0;
      long long v15 = *(_OWORD *)&self->_obj.containerBytes;
      $37FF168C8709F524D812460C59637AB1 reference = self->_obj.reference;
      if (_MDPlistDictionaryGetPlistObjectForKey())
      {
        itemsContent = self->_itemsContent;
        long long v15 = v17;
        $37FF168C8709F524D812460C59637AB1 reference = v18;
        [(CSSearchableItemAttributeSet *)v7 setContentObj:itemsContent obj:&v15];
      }
    }
  }
  v11 = [[CSSearchableItem alloc] initWithAttributeSet:v7];
  v12 = [(CSSearchableItemCodedArray *)self bundleID];
  [(CSSearchableItem *)v11 setBundleID:v12];

  v13 = [(CSSearchableItemCodedArray *)self protectionClass];
  [(CSSearchableItem *)v11 setProtection:v13];

  return v11;
}

- (NSString)protectionClass
{
  return self->_protectionClass;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (CSSearchableItemCodedArray)initWithItems:(id)a3 itemsContent:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  int v9 = [(CSSearchableItemCodedArray *)self initWithItems:v7];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_items, a3);
    if (v8)
    {
      [v8 obj];
      if (_MDPlistGetPlistObjectType() == 240)
      {
        [v8 obj];
        if (_MDPlistArrayGetCount() == 2)
        {
          [v8 obj];
          _MDPlistArrayGetPlistObjectAtIndex();
          if (_MDPlistGetPlistObjectType() == 244
            || ([v8 obj],
                _MDPlistArrayGetPlistObjectAtIndex(),
                _MDPlistGetPlistObjectType() == 245))
          {
            [v8 obj];
            _MDPlistArrayGetPlistObjectAtIndex();
            long long v11 = v15;
            $37FF168C8709F524D812460C59637AB1 v12 = v16;
            v10->_obj.$37FF168C8709F524D812460C59637AB1 reference = v16;
            *(_OWORD *)&v10->_obj.containerBytes = v11;
            long long v13 = *(_OWORD *)&v10->_obj.containerBytes;
            $37FF168C8709F524D812460C59637AB1 v16 = v12;
            long long v15 = v13;
            if (_MDPlistGetPlistObjectType() == 241) {
              objc_storeStrong((id *)&v10->_itemsContent, a4);
            }
          }
        }
      }
    }
  }

  return v10;
}

- (unint64_t)count
{
  items = self->_items;
  if (items) {
    [(CSDecoder *)items obj];
  }
  return _MDPlistArrayGetCount();
}

- (void)setProtectionClass:(id)a3
{
}

- (void)setBundleID:(id)a3
{
}

- (CSSearchableItemCodedArray)initWithItems:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSSearchableItemCodedArray;
  v6 = [(CSSearchableItemCodedArray *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_items, a3);
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protectionClass, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_itemsContent, 0);

  objc_storeStrong((id *)&self->_items, 0);
}

- (CSDecoder)items
{
  return self->_items;
}

- (CSDecoder)itemsContent
{
  return self->_itemsContent;
}

- ($917DE44C1CB612B85CED1B4C2573F471)obj
{
  *($C7C160116BA828B4EE75DF30F571EBFF *)retstr = *($C7C160116BA828B4EE75DF30F571EBFF *)((char *)self + 40);
  return self;
}

@end