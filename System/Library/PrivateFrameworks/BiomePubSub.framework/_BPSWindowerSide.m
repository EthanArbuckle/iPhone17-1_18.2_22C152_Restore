@interface _BPSWindowerSide
- (NSCopying)key;
- (NSString)identifier;
- (_BPSWindowerInner)windowerInner;
- (_BPSWindowerSide)initWithKey:(id)a3 identifier:(id)a4 windowerInner:(id)a5;
- (int64_t)receiveInput:(id)a3;
- (void)cancel;
- (void)receiveCompletion:(id)a3;
- (void)receiveSubscription:(id)a3;
- (void)requestDemand:(int64_t)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation _BPSWindowerSide

- (_BPSWindowerSide)initWithKey:(id)a3 identifier:(id)a4 windowerInner:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_BPSWindowerSide;
  v12 = [(_BPSWindowerSide *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_key, a3);
    objc_storeStrong((id *)&v13->_windowerInner, a5);
    objc_storeStrong((id *)&v13->_identifier, a4);
  }

  return v13;
}

- (void)receiveCompletion:(id)a3
{
  windowerInner = self->_windowerInner;
  key = self->_key;
  identifier = self->_identifier;
  v7 = self;
  [(_BPSWindowerInner *)windowerInner receiveCompletion:a3 key:key identifier:identifier];
}

- (int64_t)receiveInput:(id)a3
{
  windowerInner = self->_windowerInner;
  key = self->_key;
  identifier = self->_identifier;
  v7 = self;
  int64_t v8 = [(_BPSWindowerInner *)windowerInner receiveInput:a3 key:key identifier:identifier];

  return v8;
}

- (void)receiveSubscription:(id)a3
{
}

- (void)cancel
{
  windowerInner = self->_windowerInner;
  key = self->_key;
  identifier = self->_identifier;
  v5 = self;
  [(_BPSWindowerInner *)windowerInner cancelWithKey:key identifier:identifier];
}

- (void)requestDemand:(int64_t)a3
{
  windowerInner = self->_windowerInner;
  key = self->_key;
  identifier = self->_identifier;
  v7 = self;
  [(_BPSWindowerInner *)windowerInner requestDemand:a3 key:key identifier:identifier];
}

- (_BPSWindowerInner)windowerInner
{
  return self->_windowerInner;
}

- (NSCopying)key
{
  return self->_key;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_windowerInner, 0);
}

@end