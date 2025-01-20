@interface PHAmbientButtonPart
+ (id)partWithView:(id)a3 type:(int64_t)a4;
- (PHAmbientButtonPart)initWithView:(id)a3 type:(int64_t)a4;
- (UIView)view;
- (int64_t)type;
@end

@implementation PHAmbientButtonPart

- (PHAmbientButtonPart)initWithView:(id)a3 type:(int64_t)a4
{
  self->_type = a4;
  return self;
}

+ (id)partWithView:(id)a3 type:(int64_t)a4
{
  id v5 = a3;
  v6 = [[PHAmbientButtonPart alloc] initWithView:v5 type:a4];

  return v6;
}

- (UIView)view
{
  return self->_view;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
}

@end