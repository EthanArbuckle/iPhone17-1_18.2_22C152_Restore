@interface PDStoreBag
- (NSMutableDictionary)defaultValues;
- (PDStoreBag)init;
- (void)_registerBagKeys;
- (void)setDefaultValues:(id)a3;
@end

@implementation PDStoreBag

- (PDStoreBag)init
{
  v7.receiver = self;
  v7.super_class = (Class)PDStoreBag;
  v2 = [(PDStoreBag *)&v7 init];
  if (v2)
  {
    uint64_t v4 = +[AMSBag bagForProfile:@"schoolwork" profileVersion:@"1"];
    bag = v2->_bag;
    v2->_bag = (AMSBag *)v4;

    [(PDStoreBag *)v2 _registerBagKeys];
  }
  return v2;
}

- (void)_registerBagKeys
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000450A8;
  block[3] = &unk_1001F2A68;
  block[4] = self;
  if (qword_10023E4A8 != -1) {
    dispatch_once(&qword_10023E4A8, block);
  }
}

- (NSMutableDictionary)defaultValues
{
  return self->_defaultValues;
}

- (void)setDefaultValues:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultValues, 0);

  objc_storeStrong((id *)&self->_bag, 0);
}

@end