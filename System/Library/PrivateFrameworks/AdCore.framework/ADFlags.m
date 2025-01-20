@interface ADFlags
+ (id)initWithFlags:(unint64_t)a3;
- (ADFlags)init;
- (BOOL)allSet:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSet:(unint64_t)a3;
- (BOOL)noneSet;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)anySet:(unint64_t)a3;
- (unint64_t)flags;
- (void)reset;
- (void)set:(unint64_t)a3;
- (void)setFlags:(unint64_t)a3;
- (void)unset:(unint64_t)a3;
@end

@implementation ADFlags

+ (id)initWithFlags:(unint64_t)a3
{
  v4 = objc_alloc_init(ADFlags);
  [(ADFlags *)v4 set:a3];
  return v4;
}

- (ADFlags)init
{
  v5.receiver = self;
  v5.super_class = (Class)ADFlags;
  v2 = [(ADFlags *)&v5 init];
  v3 = v2;
  if (v2) {
    [(ADFlags *)v2 reset];
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_super v5 = v4;
  if (v4) {
    [v4 set:self->_flags];
  }
  return v5;
}

- (void)set:(unint64_t)a3
{
  self->_flags |= a3;
}

- (void)unset:(unint64_t)a3
{
  self->_flags &= ~a3;
}

- (void)reset
{
  self->_flags = 0;
}

- (BOOL)isSet:(unint64_t)a3
{
  return [(ADFlags *)self anySet:a3] != 0;
}

- (unint64_t)anySet:(unint64_t)a3
{
  return self->_flags & a3;
}

- (BOOL)allSet:(unint64_t)a3
{
  return (a3 & ~self->_flags) == 0;
}

- (BOOL)isEqual:(id)a3
{
  return [a3 allSet:self->_flags];
}

- (BOOL)noneSet
{
  return self->_flags == 0;
}

- (unint64_t)flags
{
  return self->_flags;
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

@end