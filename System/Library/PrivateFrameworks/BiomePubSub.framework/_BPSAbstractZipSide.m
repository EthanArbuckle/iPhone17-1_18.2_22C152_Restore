@interface _BPSAbstractZipSide
- (_BPSAbstractZip)zip;
- (_BPSAbstractZipSide)initWithIndex:(int64_t)a3 zip:(id)a4;
- (int64_t)index;
- (int64_t)receiveInput:(id)a3;
- (void)receiveCompletion:(id)a3;
- (void)receiveSubscription:(id)a3;
- (void)setIndex:(int64_t)a3;
- (void)setZip:(id)a3;
@end

@implementation _BPSAbstractZipSide

- (_BPSAbstractZipSide)initWithIndex:(int64_t)a3 zip:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_BPSAbstractZipSide;
  v8 = [(_BPSAbstractZipSide *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_index = a3;
    objc_storeStrong((id *)&v8->_zip, a4);
  }

  return v9;
}

- (void)receiveSubscription:(id)a3
{
  id v4 = a3;
  id v5 = [(_BPSAbstractZipSide *)self zip];
  objc_msgSend(v5, "receiveSubscription:index:", v4, -[_BPSAbstractZipSide index](self, "index"));
}

- (int64_t)receiveInput:(id)a3
{
  id v4 = self;
  id v5 = a3;
  v6 = [(_BPSAbstractZipSide *)v4 zip];
  int64_t v7 = objc_msgSend(v6, "receiveInput:index:", v5, -[_BPSAbstractZipSide index](v4, "index"));

  return v7;
}

- (void)receiveCompletion:(id)a3
{
  v6 = self;
  id v4 = a3;
  id v5 = [(_BPSAbstractZipSide *)v6 zip];
  objc_msgSend(v5, "receiveCompletion:index:", v4, -[_BPSAbstractZipSide index](v6, "index"));
}

- (_BPSAbstractZip)zip
{
  return self->_zip;
}

- (void)setZip:(id)a3
{
}

- (int64_t)index
{
  return self->_index;
}

- (void)setIndex:(int64_t)a3
{
  self->_index = a3;
}

- (void).cxx_destruct
{
}

@end