@interface JFXCompositionPlayableElementUpdateRequest
- (JFXCompositionPlayableElementUpdateRequest)initWithBlock:(id)a3 withClip:(id)a4;
- (NSString)clipUUID;
- (id)description;
- (void)setClipUUID:(id)a3;
@end

@implementation JFXCompositionPlayableElementUpdateRequest

- (JFXCompositionPlayableElementUpdateRequest)initWithBlock:(id)a3 withClip:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)JFXCompositionPlayableElementUpdateRequest;
  v7 = [(JFXCompositionPlayerRequest *)&v11 initWithBlock:a3 ofType:5];
  if (v7)
  {
    uint64_t v8 = [v6 uuid];
    clipUUID = v7->_clipUUID;
    v7->_clipUUID = (NSString *)v8;
  }
  return v7;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)JFXCompositionPlayableElementUpdateRequest;
  v4 = [(JFXCompositionPlayerRequest *)&v8 description];
  v5 = [(JFXCompositionPlayableElementUpdateRequest *)self clipUUID];
  id v6 = [v3 stringWithFormat:@"<%@ clipID:%@>", v4, v5];

  return v6;
}

- (NSString)clipUUID
{
  return self->_clipUUID;
}

- (void)setClipUUID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end