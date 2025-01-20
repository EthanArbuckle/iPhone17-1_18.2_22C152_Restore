@interface JFXCompositionSeekRequest
- (JFXCompositionSeekRequest)initWithBlock:(id)a3 withSeekTime:(int)a4;
- (id)description;
- (int)seekTime;
- (void)setSeekTime:(int)a3;
@end

@implementation JFXCompositionSeekRequest

- (JFXCompositionSeekRequest)initWithBlock:(id)a3 withSeekTime:(int)a4
{
  v6.receiver = self;
  v6.super_class = (Class)JFXCompositionSeekRequest;
  result = [(JFXCompositionPlayerRequest *)&v6 initWithBlock:a3 ofType:4];
  if (result) {
    result->_seekTime = a4;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)JFXCompositionSeekRequest;
  v4 = [(JFXCompositionPlayerRequest *)&v7 description];
  v5 = [v3 stringWithFormat:@"<%@ seekTime:%d>", v4, -[JFXCompositionSeekRequest seekTime](self, "seekTime")];

  return v5;
}

- (int)seekTime
{
  return self->_seekTime;
}

- (void)setSeekTime:(int)a3
{
  self->_seekTime = a3;
}

@end