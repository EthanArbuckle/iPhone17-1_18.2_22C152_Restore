@interface _DPPiRapporEncoderResult
+ (id)encoderResultWithPhi0:(id)a3 otherPhi:(id)a4;
- (NSData)otherPhi;
- (NSData)phi0;
- (_DPPiRapporEncoderResult)init;
- (_DPPiRapporEncoderResult)initWithPhi0:(id)a3 otherPhi:(id)a4;
- (unint64_t)numberOfEncodedIndices;
- (unint64_t)numberOfOtherPhi;
@end

@implementation _DPPiRapporEncoderResult

- (_DPPiRapporEncoderResult)init
{
  return 0;
}

- (_DPPiRapporEncoderResult)initWithPhi0:(id)a3 otherPhi:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v34.receiver = self;
  v34.super_class = (Class)_DPPiRapporEncoderResult;
  v9 = [(_DPPiRapporEncoderResult *)&v34 init];
  if (!v9) {
    goto LABEL_17;
  }
  if (!v7 || ![v7 length]) {
    goto LABEL_8;
  }
  if (([v7 length] & 3) == 0)
  {
    objc_storeStrong((id *)&v9->_phi0, a3);
    v9->_numberOfEncodedIndices = (unint64_t)[v7 length] >> 2;
    if (!v8) {
      goto LABEL_8;
    }
    if (([v8 length] & 3) != 0)
    {
      v10 = +[_DPLog framework];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[_DPPiRapporEncoderResult initWithPhi0:otherPhi:](v10, v19, v20, v21, v22, v23, v24, v25);
      }
      goto LABEL_7;
    }
    if (((unint64_t)[v8 length] >> 2) % v9->_numberOfEncodedIndices)
    {
      v10 = +[_DPLog framework];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[_DPPiRapporEncoderResult initWithPhi0:otherPhi:](v10, v26, v27, v28, v29, v30, v31, v32);
      }
      goto LABEL_7;
    }
    objc_storeStrong((id *)&v9->_otherPhi, a4);
    v9->_numberOfOtherPhi = ((unint64_t)[v8 length] >> 2) / v9->_numberOfEncodedIndices;
LABEL_17:
    v18 = v9;
    goto LABEL_18;
  }
  v10 = +[_DPLog framework];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[_DPPiRapporEncoderResult initWithPhi0:otherPhi:](v10, v11, v12, v13, v14, v15, v16, v17);
  }
LABEL_7:

LABEL_8:
  v18 = 0;
LABEL_18:

  return v18;
}

+ (id)encoderResultWithPhi0:(id)a3 otherPhi:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[_DPPiRapporEncoderResult alloc] initWithPhi0:v6 otherPhi:v5];

  return v7;
}

- (NSData)phi0
{
  return self->_phi0;
}

- (NSData)otherPhi
{
  return self->_otherPhi;
}

- (unint64_t)numberOfOtherPhi
{
  return self->_numberOfOtherPhi;
}

- (unint64_t)numberOfEncodedIndices
{
  return self->_numberOfEncodedIndices;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherPhi, 0);
  objc_storeStrong((id *)&self->_phi0, 0);
}

- (void)initWithPhi0:(uint64_t)a3 otherPhi:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithPhi0:(uint64_t)a3 otherPhi:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithPhi0:(uint64_t)a3 otherPhi:(uint64_t)a4 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end