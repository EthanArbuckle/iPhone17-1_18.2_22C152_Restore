@interface ANST3DPoseEstimate
+ (BOOL)supportsSecureCoding;
+ (id)new;
- (ANST3DPoseEstimate)init;
- (ANST3DPoseEstimate)initWithCoder:(id)a3;
- (ANST3DPoseEstimate)initWithYaw:(int64_t)a3 roll:(int64_t)a4 refinedYaw:(int64_t)a5 refinedRoll:(int64_t)a6 refinedPitch:(int64_t)a7;
- (id)description;
- (int64_t)refinedPitch;
- (int64_t)refinedRoll;
- (int64_t)refinedYaw;
- (int64_t)roll;
- (int64_t)yaw;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ANST3DPoseEstimate

+ (id)new
{
  id result = (id)objc_msgSend_doesNotRecognizeSelector_(a1, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANST3DPoseEstimate)init
{
  id result = (ANST3DPoseEstimate *)objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANST3DPoseEstimate)initWithYaw:(int64_t)a3 roll:(int64_t)a4 refinedYaw:(int64_t)a5 refinedRoll:(int64_t)a6 refinedPitch:(int64_t)a7
{
  v13.receiver = self;
  v13.super_class = (Class)ANST3DPoseEstimate;
  id result = [(ANST3DPoseEstimate *)&v13 init];
  result->_yaw = a3;
  result->_roll = a4;
  result->_refinedYaw = a5;
  result->_refinedRoll = a6;
  result->_refinedPitch = a7;
  return result;
}

- (ANST3DPoseEstimate)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ANST3DPoseEstimate;
  v5 = [(ANST3DPoseEstimate *)&v8 init];
  if (sub_246D69F54(v4, &v5->_yaw, "yaw")
    && sub_246D69F54(v4, &v5->_roll, sel_roll)
    && sub_246D69F54(v4, &v5->_refinedYaw, sel_refinedYaw)
    && sub_246D69F54(v4, &v5->_refinedRoll, sel_refinedRoll)
    && sub_246D69F54(v4, &v5->_refinedPitch, sel_refinedPitch))
  {
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t yaw = self->_yaw;
  id v5 = a3;
  sub_246D6A070(v5, yaw, "yaw");
  sub_246D6A070(v5, self->_roll, sel_roll);
  sub_246D6A070(v5, self->_refinedYaw, sel_refinedYaw);
  sub_246D6A070(v5, self->_refinedRoll, sel_refinedRoll);
  sub_246D6A070(v5, self->_refinedPitch, sel_refinedPitch);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  objc_msgSend_appendFormat_(v3, v4, @"<ANST3DPoseEstimate %p> {\n", self);
  objc_msgSend_appendFormat_(v3, v5, @"    yaw          %ld\n", self->_yaw);
  objc_msgSend_appendFormat_(v3, v6, @"    roll         %ld\n", self->_roll);
  objc_msgSend_appendFormat_(v3, v7, @"    refinedYaw   %ld\n", self->_refinedYaw);
  objc_msgSend_appendFormat_(v3, v8, @"    refinedRoll  %ld\n", self->_refinedRoll);
  objc_msgSend_appendFormat_(v3, v9, @"    refinedPitch %ld\n", self->_refinedPitch);
  objc_msgSend_appendString_(v3, v10, @"}");
  objc_super v13 = objc_msgSend_copy(v3, v11, v12);

  return v13;
}

- (int64_t)yaw
{
  return self->_yaw;
}

- (int64_t)roll
{
  return self->_roll;
}

- (int64_t)refinedYaw
{
  return self->_refinedYaw;
}

- (int64_t)refinedRoll
{
  return self->_refinedRoll;
}

- (int64_t)refinedPitch
{
  return self->_refinedPitch;
}

@end