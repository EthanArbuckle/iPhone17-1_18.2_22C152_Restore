@interface RTLocationOfInterestTransition
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSDate)startDate;
- (NSDate)stopDate;
- (NSUUID)identifier;
- (NSUUID)visitIdentifierDestination;
- (NSUUID)visitIdentifierOrigin;
- (RTLocationOfInterestTransition)initWithCoder:(id)a3;
- (RTLocationOfInterestTransition)initWithIdentifier:(id)a3 startDate:(id)a4 stopDate:(id)a5 visitIdentifierOrigin:(id)a6 visitIdentifierDestination:(id)a7 modeOfTransportation:(int64_t)a8;
- (id)description;
- (int64_t)modeOfTransportation;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation RTLocationOfInterestTransition

- (RTLocationOfInterestTransition)initWithIdentifier:(id)a3 startDate:(id)a4 stopDate:(id)a5 visitIdentifierOrigin:(id)a6 visitIdentifierDestination:(id)a7 modeOfTransportation:(int64_t)a8
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  if (v14)
  {
    if (v15) {
      goto LABEL_3;
    }
  }
  else
  {
    v26 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "-[RTLocationOfInterestTransition initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifier"
            "Destination:modeOfTransportation:]";
      __int16 v36 = 1024;
      int v37 = 33;
      _os_log_error_impl(&dword_1A8FEF000, v26, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier (in %s:%d)", buf, 0x12u);
    }

    if (v15)
    {
LABEL_3:
      if (v16) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  v27 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v35 = "-[RTLocationOfInterestTransition initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifierDe"
          "stination:modeOfTransportation:]";
    __int16 v36 = 1024;
    int v37 = 34;
    _os_log_error_impl(&dword_1A8FEF000, v27, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: startDate (in %s:%d)", buf, 0x12u);
  }

  if (v16)
  {
LABEL_4:
    if (v17) {
      goto LABEL_5;
    }
LABEL_22:
    v29 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "-[RTLocationOfInterestTransition initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifier"
            "Destination:modeOfTransportation:]";
      __int16 v36 = 1024;
      int v37 = 36;
      _os_log_error_impl(&dword_1A8FEF000, v29, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visitIdentifierOrigin (in %s:%d)", buf, 0x12u);
    }

    if (v18) {
      goto LABEL_6;
    }
    goto LABEL_25;
  }
LABEL_19:
  v28 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v35 = "-[RTLocationOfInterestTransition initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifierDe"
          "stination:modeOfTransportation:]";
    __int16 v36 = 1024;
    int v37 = 35;
    _os_log_error_impl(&dword_1A8FEF000, v28, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: stopDate (in %s:%d)", buf, 0x12u);
  }

  if (!v17) {
    goto LABEL_22;
  }
LABEL_5:
  if (v18)
  {
LABEL_6:
    v19 = 0;
    if (v14 && v15 && v16 && v17)
    {
      v33.receiver = self;
      v33.super_class = (Class)RTLocationOfInterestTransition;
      v20 = [(RTLocationOfInterestTransition *)&v33 init];
      v21 = v20;
      if (v20)
      {
        objc_storeStrong((id *)&v20->_identifier, a3);
        uint64_t v22 = [v15 copy];
        startDate = v21->_startDate;
        v21->_startDate = (NSDate *)v22;

        uint64_t v24 = [v16 copy];
        stopDate = v21->_stopDate;
        v21->_stopDate = (NSDate *)v24;

        objc_storeStrong((id *)&v21->_visitIdentifierOrigin, a6);
        objc_storeStrong((id *)&v21->_visitIdentifierDestination, a7);
        v21->_modeOfTransportation = a8;
      }
      self = v21;
      v19 = self;
    }
    goto LABEL_28;
  }
LABEL_25:
  v30 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v35 = "-[RTLocationOfInterestTransition initWithIdentifier:startDate:stopDate:visitIdentifierOrigin:visitIdentifierDe"
          "stination:modeOfTransportation:]";
    __int16 v36 = 1024;
    int v37 = 37;
    _os_log_error_impl(&dword_1A8FEF000, v30, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visitIdentifierDestination (in %s:%d)", buf, 0x12u);
  }

  v19 = 0;
LABEL_28:

  return v19;
}

- (id)description
{
  id v14 = (void *)MEMORY[0x1E4F28E78];
  id v16 = [(RTLocationOfInterestTransition *)self identifier];
  v3 = [v16 UUIDString];
  id v15 = [(RTLocationOfInterestTransition *)self startDate];
  v4 = [v15 stringFromDate];
  v5 = [(RTLocationOfInterestTransition *)self stopDate];
  v6 = [v5 stringFromDate];
  v7 = [(RTLocationOfInterestTransition *)self visitIdentifierOrigin];
  v8 = [v7 UUIDString];
  v9 = [(RTLocationOfInterestTransition *)self visitIdentifierDestination];
  v10 = [v9 UUIDString];
  v11 = +[RTRoutineManager modeOfTransportationToString:[(RTLocationOfInterestTransition *)self modeOfTransportation]];
  v12 = [v14 stringWithFormat:@"identifier, %@, startDate, %@, stopDate, %@, origin, %@, destination, %@, modeOfTransportation, %@", v3, v4, v6, v8, v10, v11];

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTLocationOfInterestTransition)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)RTLocationOfInterestTransition;
  v5 = [(RTLocationOfInterestTransition *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"startDate"];
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stopDate"];
    stopDate = v5->_stopDate;
    v5->_stopDate = (NSDate *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"visitIdentifierOrigin"];
    visitIdentifierOrigin = v5->_visitIdentifierOrigin;
    v5->_visitIdentifierOrigin = (NSUUID *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"visitIdentifierDestination"];
    visitIdentifierDestination = v5->_visitIdentifierDestination;
    v5->_visitIdentifierDestination = (NSUUID *)v14;

    v5->_modeOfTransportation = [v4 decodeIntegerForKey:@"modeOfTransportation"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_startDate forKey:@"startDate"];
  [v5 encodeObject:self->_stopDate forKey:@"stopDate"];
  [v5 encodeObject:self->_visitIdentifierOrigin forKey:@"visitIdentifierOrigin"];
  [v5 encodeObject:self->_visitIdentifierDestination forKey:@"visitIdentifierDestination"];
  [v5 encodeInteger:self->_modeOfTransportation forKey:@"modeOfTransportation"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RTLocationOfInterestTransition *)a3;
  id v5 = v4;
  if (self == v4)
  {
    char v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = v5;
    v7 = [(RTLocationOfInterestTransition *)self identifier];
    uint64_t v8 = [(RTLocationOfInterestTransition *)v6 identifier];

    char v9 = [v7 isEqual:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v2 = [(RTLocationOfInterestTransition *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)stopDate
{
  return self->_stopDate;
}

- (NSUUID)visitIdentifierOrigin
{
  return self->_visitIdentifierOrigin;
}

- (NSUUID)visitIdentifierDestination
{
  return self->_visitIdentifierDestination;
}

- (int64_t)modeOfTransportation
{
  return self->_modeOfTransportation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visitIdentifierDestination, 0);
  objc_storeStrong((id *)&self->_visitIdentifierOrigin, 0);
  objc_storeStrong((id *)&self->_stopDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end