@interface DMFRequestAirPlayMirroringResultObject
+ (BOOL)supportsSecureCoding;
- (DMFRequestAirPlayMirroringResultObject)initWithCoder:(id)a3;
- (DMFRequestAirPlayMirroringResultObject)initWithStatus:(unint64_t)a3;
- (unint64_t)status;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DMFRequestAirPlayMirroringResultObject

- (DMFRequestAirPlayMirroringResultObject)initWithStatus:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DMFRequestAirPlayMirroringResultObject;
  result = [(CATTaskResultObject *)&v5 init];
  if (result) {
    result->_status = a3;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFRequestAirPlayMirroringResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DMFRequestAirPlayMirroringResultObject;
  objc_super v5 = [(CATTaskResultObject *)&v8 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"status"];
    v5->_status = [v6 unsignedIntegerValue];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DMFRequestAirPlayMirroringResultObject;
  id v4 = a3;
  [(CATTaskResultObject *)&v6 encodeWithCoder:v4];
  objc_super v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[DMFRequestAirPlayMirroringResultObject status](self, "status", v6.receiver, v6.super_class));
  [v4 encodeObject:v5 forKey:@"status"];
}

- (unint64_t)status
{
  return self->_status;
}

@end