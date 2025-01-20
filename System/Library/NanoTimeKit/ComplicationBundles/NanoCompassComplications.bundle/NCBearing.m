@interface NCBearing
+ (NCBearing)idealizedBearing;
+ (id)randomizedBearing;
- (NCBearing)initWithBearing:(double)a3;
- (NCBearing)initWithHeading:(id)a3;
- (double)bearing;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setBearing:(double)a3;
@end

@implementation NCBearing

- (NCBearing)initWithBearing:(double)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NCBearing;
  v4 = [(NCBearing *)&v10 init];
  for (i = v4; a3 < 0.0; a3 = a3 + 360.0)
    ;
  for (; a3 >= 360.0; a3 = a3 + -360.0)
    ;
  objc_msgSend_setBearing_(v4, v5, v6, v7, floor(a3));
  return i;
}

- (NCBearing)initWithHeading:(id)a3
{
  objc_msgSend_heading(a3, a2, (uint64_t)a3, v3);

  return (NCBearing *)objc_msgSend_initWithBearing_(self, v5, v6, v7);
}

+ (NCBearing)idealizedBearing
{
  if (qword_268920CE8 != -1) {
    dispatch_once(&qword_268920CE8, &unk_26EA488E0);
  }
  v2 = (void *)qword_268920CE0;

  return (NCBearing *)v2;
}

+ (id)randomizedBearing
{
  v2 = [NCBearing alloc];
  uint32_t v3 = arc4random_uniform(0x168u);
  uint64_t v7 = objc_msgSend_initWithBearing_(v2, v4, v5, v6, (double)v3);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [NCBearing alloc];
  objc_msgSend_bearing(self, v5, v6, v7);

  return (id)objc_msgSend_initWithBearing_(v4, v8, v9, v10);
}

- (double)bearing
{
  return self->_bearing;
}

- (void)setBearing:(double)a3
{
  self->_bearing = a3;
}

@end