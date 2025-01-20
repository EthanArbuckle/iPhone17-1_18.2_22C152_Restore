@interface CAROEMPunchThrough
- (CAROEMPunchThrough)initWithDictionary:(id)a3;
- (CGSize)size;
- (NSString)identifier;
- (unint64_t)type;
@end

@implementation CAROEMPunchThrough

- (CAROEMPunchThrough)initWithDictionary:(id)a3
{
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)CAROEMPunchThrough;
  v5 = [(CAROEMPunchThrough *)&v36 init];
  if (!v5) {
    goto LABEL_21;
  }
  objc_opt_class();
  id v6 = [v4 objectForKey:@"inputStreamUID"];
  if (v6 && (objc_opt_isKindOfClass() & 1) != 0) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }

  if (!v7)
  {
    v7 = CarGeneralLogging();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CAROEMPunchThrough initWithDictionary:]((uint64_t)v4, v7, v14, v15, v16, v17, v18, v19);
    }
    goto LABEL_28;
  }
  uint64_t v8 = [v7 copy];
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v8;

  objc_opt_class();
  id v10 = [v4 objectForKey:@"viewArea"];
  if (v10 && (objc_opt_isKindOfClass() & 1) != 0) {
    v11 = v10;
  }
  else {
    v11 = 0;
  }

  if (!v11)
  {
    v11 = CarGeneralLogging();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[CAROEMPunchThrough initWithDictionary:]((uint64_t)v4, v11, v22, v23, v24, v25, v26, v27);
    }
    goto LABEL_27;
  }
  CRSizeFromAirPlayDictionary(v11, &v5->_size.width);
  objc_opt_class();
  id v12 = [v4 objectForKey:@"inputStreamType"];
  if (v12 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v13 = v12;
  }
  else {
    id v13 = 0;
  }

  unsigned int v20 = [v13 unsignedIntValue];
  if (!v13 || v20 >= 4)
  {
    v28 = CarGeneralLogging();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[CAROEMPunchThrough initWithDictionary:]((uint64_t)v4, v28, v29, v30, v31, v32, v33, v34);
    }

LABEL_27:
LABEL_28:

    v21 = 0;
    goto LABEL_29;
  }
  v5->_type = v20;

LABEL_21:
  v21 = v5;
LABEL_29:

  return v21;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (unint64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
}

- (void)initWithDictionary:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithDictionary:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithDictionary:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end