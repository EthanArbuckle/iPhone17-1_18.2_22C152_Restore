@interface ENUITextPosition
+ (id)positionWithLocation:(unint64_t)a3;
- (unint64_t)location;
- (void)setLocation:(unint64_t)a3;
@end

@implementation ENUITextPosition

+ (id)positionWithLocation:(unint64_t)a3
{
  v4 = objc_alloc_init(ENUITextPosition);
  [(ENUITextPosition *)v4 setLocation:a3];

  return v4;
}

- (unint64_t)location
{
  return self->_location;
}

- (void)setLocation:(unint64_t)a3
{
  self->_location = a3;
}

@end