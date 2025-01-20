@interface BMLocationHashedCoordinates
+ (id)columns;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
+ (id)protoFields;
+ (id)validKeyPaths;
+ (unsigned)latestDataVersion;
- (BMLocationHashedCoordinates)initWithJSONDictionary:(id)a3 error:(id *)a4;
- (BMLocationHashedCoordinates)initWithLocationHashAt300Meters:(id)a3 locationHashAt2500Meters:(id)a4 locationHashAt156Kilometers:(id)a5 distanceFromHomeOfCurrentLocationInMeters:(id)a6 distanceFromWorkOfCurrentLocationInMeters:(id)a7 distanceFromSchoolOfCurrentLocationInMeters:(id)a8 distanceFromGymOfCurrentLocationInMeters:(id)a9 floor:(id)a10 speedBucket:(int)a11 altitudeBucket:(int)a12;
- (BMLocationHashedCoordinates)initWithLocationHashAt300Meters:(id)a3 locationHashAt2500Meters:(id)a4 locationHashAt156Kilometers:(id)a5 distanceFromHomeOfCurrentLocationInMeters:(id)a6 distanceFromWorkOfCurrentLocationInMeters:(id)a7 distanceFromSchoolOfCurrentLocationInMeters:(id)a8 distanceFromGymOfCurrentLocationInMeters:(id)a9 floor:(id)a10 speedBucket:(int)a11 altitudeBucket:(int)a12 distanceBucketFromHome:(int)a13 distanceBucketFromWork:(int)a14 distanceBucketFromGym:(int)a15 distanceBucketFromSchool:(int)a16;
- (BMLocationHashedCoordinates)initWithLocationHashAt300Meters:(id)a3 locationHashAt2500Meters:(id)a4 locationHashAt156Kilometers:(id)a5 floor:(id)a6 speedBucket:(int)a7 altitudeBucket:(int)a8 distanceBucketFromHome:(int)a9 distanceBucketFromWork:(int)a10 distanceBucketFromGym:(int)a11 distanceBucketFromSchool:(int)a12;
- (BOOL)hasDistanceFromGymOfCurrentLocationInMeters;
- (BOOL)hasDistanceFromHomeOfCurrentLocationInMeters;
- (BOOL)hasDistanceFromSchoolOfCurrentLocationInMeters;
- (BOOL)hasDistanceFromWorkOfCurrentLocationInMeters;
- (BOOL)hasFloor;
- (BOOL)hasLocationHashAt156Kilometers;
- (BOOL)hasLocationHashAt2500Meters;
- (BOOL)hasLocationHashAt300Meters;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (double)distanceFromGymOfCurrentLocationInMeters;
- (double)distanceFromHomeOfCurrentLocationInMeters;
- (double)distanceFromSchoolOfCurrentLocationInMeters;
- (double)distanceFromWorkOfCurrentLocationInMeters;
- (id)initByReadFrom:(id)a3;
- (id)jsonDictionary;
- (id)serialize;
- (int)altitudeBucket;
- (int)distanceBucketFromGym;
- (int)distanceBucketFromHome;
- (int)distanceBucketFromSchool;
- (int)distanceBucketFromWork;
- (int)floor;
- (int)speedBucket;
- (unint64_t)locationHashAt156Kilometers;
- (unint64_t)locationHashAt2500Meters;
- (unint64_t)locationHashAt300Meters;
- (unsigned)dataVersion;
- (void)setHasDistanceFromGymOfCurrentLocationInMeters:(BOOL)a3;
- (void)setHasDistanceFromHomeOfCurrentLocationInMeters:(BOOL)a3;
- (void)setHasDistanceFromSchoolOfCurrentLocationInMeters:(BOOL)a3;
- (void)setHasDistanceFromWorkOfCurrentLocationInMeters:(BOOL)a3;
- (void)setHasFloor:(BOOL)a3;
- (void)setHasLocationHashAt156Kilometers:(BOOL)a3;
- (void)setHasLocationHashAt2500Meters:(BOOL)a3;
- (void)setHasLocationHashAt300Meters:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMLocationHashedCoordinates

- (void)setHasDistanceFromGymOfCurrentLocationInMeters:(BOOL)a3
{
  self->_hasDistanceFromGymOfCurrentLocationInMeters = a3;
}

- (BOOL)hasDistanceFromGymOfCurrentLocationInMeters
{
  return self->_hasDistanceFromGymOfCurrentLocationInMeters;
}

- (double)distanceFromGymOfCurrentLocationInMeters
{
  return self->_distanceFromGymOfCurrentLocationInMeters;
}

- (void)setHasDistanceFromSchoolOfCurrentLocationInMeters:(BOOL)a3
{
  self->_hasDistanceFromSchoolOfCurrentLocationInMeters = a3;
}

- (BOOL)hasDistanceFromSchoolOfCurrentLocationInMeters
{
  return self->_hasDistanceFromSchoolOfCurrentLocationInMeters;
}

- (double)distanceFromSchoolOfCurrentLocationInMeters
{
  return self->_distanceFromSchoolOfCurrentLocationInMeters;
}

- (void)setHasDistanceFromWorkOfCurrentLocationInMeters:(BOOL)a3
{
  self->_hasDistanceFromWorkOfCurrentLocationInMeters = a3;
}

- (BOOL)hasDistanceFromWorkOfCurrentLocationInMeters
{
  return self->_hasDistanceFromWorkOfCurrentLocationInMeters;
}

- (double)distanceFromWorkOfCurrentLocationInMeters
{
  return self->_distanceFromWorkOfCurrentLocationInMeters;
}

- (void)setHasDistanceFromHomeOfCurrentLocationInMeters:(BOOL)a3
{
  self->_hasDistanceFromHomeOfCurrentLocationInMeters = a3;
}

- (BOOL)hasDistanceFromHomeOfCurrentLocationInMeters
{
  return self->_hasDistanceFromHomeOfCurrentLocationInMeters;
}

- (double)distanceFromHomeOfCurrentLocationInMeters
{
  return self->_distanceFromHomeOfCurrentLocationInMeters;
}

- (int)distanceBucketFromSchool
{
  return self->_distanceBucketFromSchool;
}

- (int)distanceBucketFromGym
{
  return self->_distanceBucketFromGym;
}

- (int)distanceBucketFromWork
{
  return self->_distanceBucketFromWork;
}

- (int)distanceBucketFromHome
{
  return self->_distanceBucketFromHome;
}

- (int)altitudeBucket
{
  return self->_altitudeBucket;
}

- (int)speedBucket
{
  return self->_speedBucket;
}

- (void)setHasFloor:(BOOL)a3
{
  self->_hasFloor = a3;
}

- (BOOL)hasFloor
{
  return self->_hasFloor;
}

- (int)floor
{
  return self->_floor;
}

- (void)setHasLocationHashAt156Kilometers:(BOOL)a3
{
  self->_hasLocationHashAt156Kilometers = a3;
}

- (BOOL)hasLocationHashAt156Kilometers
{
  return self->_hasLocationHashAt156Kilometers;
}

- (unint64_t)locationHashAt156Kilometers
{
  return self->_locationHashAt156Kilometers;
}

- (void)setHasLocationHashAt2500Meters:(BOOL)a3
{
  self->_hasLocationHashAt2500Meters = a3;
}

- (BOOL)hasLocationHashAt2500Meters
{
  return self->_hasLocationHashAt2500Meters;
}

- (unint64_t)locationHashAt2500Meters
{
  return self->_locationHashAt2500Meters;
}

- (void)setHasLocationHashAt300Meters:(BOOL)a3
{
  self->_hasLocationHashAt300Meters = a3;
}

- (BOOL)hasLocationHashAt300Meters
{
  return self->_hasLocationHashAt300Meters;
}

- (unint64_t)locationHashAt300Meters
{
  return self->_locationHashAt300Meters;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if ([(BMLocationHashedCoordinates *)self hasLocationHashAt300Meters]
      || [v5 hasLocationHashAt300Meters])
    {
      if (![(BMLocationHashedCoordinates *)self hasLocationHashAt300Meters]) {
        goto LABEL_29;
      }
      if (![v5 hasLocationHashAt300Meters]) {
        goto LABEL_29;
      }
      unint64_t v6 = [(BMLocationHashedCoordinates *)self locationHashAt300Meters];
      if (v6 != [v5 locationHashAt300Meters]) {
        goto LABEL_29;
      }
    }
    if ([(BMLocationHashedCoordinates *)self hasLocationHashAt2500Meters]
      || [v5 hasLocationHashAt2500Meters])
    {
      if (![(BMLocationHashedCoordinates *)self hasLocationHashAt2500Meters]) {
        goto LABEL_29;
      }
      if (![v5 hasLocationHashAt2500Meters]) {
        goto LABEL_29;
      }
      unint64_t v7 = [(BMLocationHashedCoordinates *)self locationHashAt2500Meters];
      if (v7 != [v5 locationHashAt2500Meters]) {
        goto LABEL_29;
      }
    }
    if ((![(BMLocationHashedCoordinates *)self hasLocationHashAt156Kilometers]
       && ![v5 hasLocationHashAt156Kilometers]
       || [(BMLocationHashedCoordinates *)self hasLocationHashAt156Kilometers]
       && [v5 hasLocationHashAt156Kilometers]
       && (unint64_t v8 = [(BMLocationHashedCoordinates *)self locationHashAt156Kilometers],
           v8 == [v5 locationHashAt156Kilometers]))
      && (!-[BMLocationHashedCoordinates hasFloor](self, "hasFloor") && ![v5 hasFloor]
       || [(BMLocationHashedCoordinates *)self hasFloor]
       && [v5 hasFloor]
       && (int v9 = -[BMLocationHashedCoordinates floor](self, "floor"), v9 == [v5 floor]))
      && (int v10 = [(BMLocationHashedCoordinates *)self speedBucket],
          v10 == [v5 speedBucket])
      && (int v11 = [(BMLocationHashedCoordinates *)self altitudeBucket],
          v11 == [v5 altitudeBucket])
      && (int v12 = [(BMLocationHashedCoordinates *)self distanceBucketFromHome],
          v12 == [v5 distanceBucketFromHome])
      && (int v13 = [(BMLocationHashedCoordinates *)self distanceBucketFromWork],
          v13 == [v5 distanceBucketFromWork])
      && (int v14 = [(BMLocationHashedCoordinates *)self distanceBucketFromGym],
          v14 == [v5 distanceBucketFromGym]))
    {
      int v15 = [(BMLocationHashedCoordinates *)self distanceBucketFromSchool];
      BOOL v16 = v15 == [v5 distanceBucketFromSchool];
    }
    else
    {
LABEL_29:
      BOOL v16 = 0;
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (id)jsonDictionary
{
  v37[10] = *MEMORY[0x1E4F143B8];
  if ([(BMLocationHashedCoordinates *)self hasLocationHashAt300Meters])
  {
    uint64_t v3 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[BMLocationHashedCoordinates locationHashAt300Meters](self, "locationHashAt300Meters"));
  }
  else
  {
    uint64_t v3 = 0;
  }
  if ([(BMLocationHashedCoordinates *)self hasLocationHashAt2500Meters])
  {
    uint64_t v4 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[BMLocationHashedCoordinates locationHashAt2500Meters](self, "locationHashAt2500Meters"));
  }
  else
  {
    uint64_t v4 = 0;
  }
  if ([(BMLocationHashedCoordinates *)self hasLocationHashAt156Kilometers])
  {
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[BMLocationHashedCoordinates locationHashAt156Kilometers](self, "locationHashAt156Kilometers"));
  }
  else
  {
    uint64_t v5 = 0;
  }
  if ([(BMLocationHashedCoordinates *)self hasFloor])
  {
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithInt:", -[BMLocationHashedCoordinates floor](self, "floor"));
  }
  else
  {
    uint64_t v6 = 0;
  }
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithInt:", -[BMLocationHashedCoordinates speedBucket](self, "speedBucket"));
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithInt:", -[BMLocationHashedCoordinates altitudeBucket](self, "altitudeBucket"));
  v35 = objc_msgSend(NSNumber, "numberWithInt:", -[BMLocationHashedCoordinates distanceBucketFromHome](self, "distanceBucketFromHome"));
  int v9 = objc_msgSend(NSNumber, "numberWithInt:", -[BMLocationHashedCoordinates distanceBucketFromWork](self, "distanceBucketFromWork"));
  int v10 = objc_msgSend(NSNumber, "numberWithInt:", -[BMLocationHashedCoordinates distanceBucketFromGym](self, "distanceBucketFromGym"));
  int v11 = objc_msgSend(NSNumber, "numberWithInt:", -[BMLocationHashedCoordinates distanceBucketFromSchool](self, "distanceBucketFromSchool"));
  v36[0] = @"locationHashAt300Meters";
  uint64_t v12 = v3;
  if (!v3)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
  }
  v29 = (void *)v12;
  v37[0] = v12;
  v36[1] = @"locationHashAt2500Meters";
  uint64_t v13 = v4;
  if (!v4)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v28 = (void *)v13;
  v37[1] = v13;
  v36[2] = @"locationHashAt156Kilometers";
  uint64_t v14 = v5;
  if (!v5)
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  }
  v34 = (void *)v3;
  v27 = (void *)v14;
  v37[2] = v14;
  v36[3] = @"floor";
  uint64_t v15 = v6;
  if (!v6)
  {
    uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
  }
  v33 = (void *)v4;
  v26 = (void *)v15;
  v37[3] = v15;
  v36[4] = @"speedBucket";
  uint64_t v16 = v7;
  if (!v7)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA98] null];
  }
  v32 = (void *)v5;
  v25 = (void *)v16;
  v37[4] = v16;
  v36[5] = @"altitudeBucket";
  v17 = (void *)v8;
  if (!v8)
  {
    v17 = [MEMORY[0x1E4F1CA98] null];
  }
  v31 = (void *)v6;
  v37[5] = v17;
  v36[6] = @"distanceBucketFromHome";
  v18 = v35;
  if (!v35)
  {
    v18 = [MEMORY[0x1E4F1CA98] null];
  }
  v19 = (void *)v7;
  v37[6] = v18;
  v36[7] = @"distanceBucketFromWork";
  v20 = v9;
  if (!v9)
  {
    v20 = [MEMORY[0x1E4F1CA98] null];
  }
  v21 = (void *)v8;
  v37[7] = v20;
  v36[8] = @"distanceBucketFromGym";
  v22 = v10;
  if (!v10)
  {
    v22 = [MEMORY[0x1E4F1CA98] null];
  }
  v37[8] = v22;
  v36[9] = @"distanceBucketFromSchool";
  v23 = v11;
  if (!v11)
  {
    v23 = [MEMORY[0x1E4F1CA98] null];
  }
  v37[9] = v23;
  id v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:10];
  if (v11)
  {
    if (v10) {
      goto LABEL_35;
    }
  }
  else
  {

    if (v10) {
      goto LABEL_35;
    }
  }

LABEL_35:
  if (!v9) {

  }
  if (!v35) {
  if (!v21)
  }

  if (!v19) {
  if (!v31)
  }

  if (v32)
  {
    if (v33) {
      goto LABEL_47;
    }
LABEL_54:

    if (v34) {
      goto LABEL_48;
    }
    goto LABEL_55;
  }

  if (!v33) {
    goto LABEL_54;
  }
LABEL_47:
  if (v34) {
    goto LABEL_48;
  }
LABEL_55:

LABEL_48:

  return v30;
}

- (BMLocationHashedCoordinates)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  v134[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [v5 objectForKeyedSubscript:@"locationHashAt300Meters"];
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v113 = 0;
LABEL_4:
    uint64_t v7 = [v5 objectForKeyedSubscript:@"locationHashAt2500Meters"];
    if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v18 = 0;
          goto LABEL_82;
        }
        id v21 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v22 = *MEMORY[0x1E4F502C8];
        uint64_t v131 = *MEMORY[0x1E4F28568];
        v23 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"locationHashAt2500Meters"];
        v132 = v23;
        uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v132 forKeys:&v131 count:1];
        id v24 = (id)[v21 initWithDomain:v22 code:2 userInfo:v8];
        v18 = 0;
        v25 = a4;
        a4 = 0;
        id *v25 = v24;
        goto LABEL_81;
      }
      id v108 = v7;
    }
    else
    {
      id v108 = 0;
    }
    uint64_t v8 = [v5 objectForKeyedSubscript:@"locationHashAt156Kilometers"];
    if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          v23 = 0;
          v18 = v108;
          goto LABEL_81;
        }
        id v26 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v27 = *MEMORY[0x1E4F502C8];
        uint64_t v129 = *MEMORY[0x1E4F28568];
        v28 = a4;
        v29 = v8;
        id v30 = [NSString alloc];
        uint64_t v91 = objc_opt_class();
        v31 = v30;
        uint64_t v8 = v29;
        id v111 = (id)[v31 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v91, @"locationHashAt156Kilometers"];
        id v130 = v111;
        uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v130 forKeys:&v129 count:1];
        v33 = v26;
        int v10 = (void *)v32;
        v23 = 0;
        a4 = 0;
        id *v28 = (id)[v33 initWithDomain:v27 code:2 userInfo:v32];
        v18 = v108;
LABEL_80:

LABEL_81:
        goto LABEL_82;
      }
      id v107 = v8;
    }
    else
    {
      id v107 = 0;
    }
    uint64_t v9 = [v5 objectForKeyedSubscript:@"floor"];
    v109 = (void *)v9;
    if (v9 && (int v10 = (void *)v9, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (!a4)
        {
          id v111 = 0;
          v23 = v107;
          v18 = v108;
          goto LABEL_80;
        }
        id v34 = objc_alloc(MEMORY[0x1E4F28C58]);
        uint64_t v35 = *MEMORY[0x1E4F502C8];
        uint64_t v127 = *MEMORY[0x1E4F28568];
        v36 = a4;
        v37 = v8;
        id v38 = [NSString alloc];
        uint64_t v92 = objc_opt_class();
        v39 = v38;
        uint64_t v8 = v37;
        id v112 = (id)[v39 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", v92, @"floor"];
        id v128 = v112;
        uint64_t v40 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v128 forKeys:&v127 count:1];
        v41 = v34;
        int v10 = v109;
        v104 = (void *)v40;
        id v111 = 0;
        a4 = 0;
        id *v36 = (id)objc_msgSend(v41, "initWithDomain:code:userInfo:", v35, 2);
        v23 = v107;
        v18 = v108;
        goto LABEL_79;
      }
      id v111 = v10;
    }
    else
    {
      id v111 = 0;
    }
    uint64_t v11 = [v5 objectForKeyedSubscript:@"speedBucket"];
    v104 = (void *)v11;
    v105 = v7;
    if (v11 && (uint64_t v12 = (void *)v11, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v112 = v12;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (!a4)
          {
            id v112 = 0;
            v23 = v107;
            v18 = v108;
            int v10 = v109;
            goto LABEL_79;
          }
          id v59 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v60 = *MEMORY[0x1E4F502C8];
          uint64_t v125 = *MEMORY[0x1E4F28568];
          v61 = v8;
          id v62 = [NSString alloc];
          uint64_t v94 = objc_opt_class();
          v63 = v62;
          uint64_t v8 = v61;
          id v110 = (id)[v63 initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", v94, @"speedBucket"];
          id v126 = v110;
          v101 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v126 forKeys:&v125 count:1];
          id v64 = (id)objc_msgSend(v59, "initWithDomain:code:userInfo:", v60, 2);
          id v112 = 0;
          v65 = a4;
          a4 = 0;
          id *v65 = v64;
          goto LABEL_102;
        }
        id v112 = [NSNumber numberWithInt:BMLocationHashedCoordinatesSpeedRangeFromString(v12)];
      }
    }
    else
    {
      id v112 = 0;
    }
    uint64_t v13 = [v5 objectForKeyedSubscript:@"altitudeBucket"];
    v101 = (void *)v13;
    if (!v13 || (uint64_t v14 = (void *)v13, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v110 = 0;
LABEL_19:
      id v15 = [v5 objectForKeyedSubscript:@"distanceBucketFromHome"];
      v100 = v15;
      if (!v15) {
        goto LABEL_50;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v15 = 0;
        goto LABEL_50;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v15 = v15;
        goto LABEL_50;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v15 = [NSNumber numberWithInt:BMLocationHashedCoordinatesDistanceRangeFromString(v15)];
LABEL_50:
        uint64_t v42 = [v5 objectForKeyedSubscript:@"distanceBucketFromWork"];
        v98 = v8;
        v99 = (void *)v42;
        if (!v42 || (v43 = (void *)v42, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v103 = 0;
LABEL_53:
          uint64_t v44 = [v5 objectForKeyedSubscript:@"distanceBucketFromGym"];
          int v10 = v109;
          v97 = (void *)v44;
          if (v44 && (v45 = (void *)v44, objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v46 = a4;
              id v102 = v45;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (!a4)
                {
                  id v102 = 0;
                  v23 = v107;
                  v18 = v108;
                  goto LABEL_75;
                }
                v82 = a4;
                id v83 = objc_alloc(MEMORY[0x1E4F28C58]);
                v84 = v6;
                uint64_t v85 = *MEMORY[0x1E4F502C8];
                uint64_t v117 = *MEMORY[0x1E4F28568];
                v50 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"distanceBucketFromGym"];
                v118 = v50;
                v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v118 forKeys:&v117 count:1];
                uint64_t v86 = v85;
                uint64_t v6 = v84;
                id v87 = (id)[v83 initWithDomain:v86 code:2 userInfo:v47];
                id v102 = 0;
                a4 = 0;
                id *v82 = v87;
                v23 = v107;
                v18 = v108;
                goto LABEL_74;
              }
              v46 = a4;
              id v102 = [NSNumber numberWithInt:BMLocationHashedCoordinatesDistanceRangeFromString(v45)];
            }
          }
          else
          {
            v46 = a4;
            id v102 = 0;
          }
          v47 = [v5 objectForKeyedSubscript:@"distanceBucketFromSchool"];
          id v96 = v5;
          if (v47 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v48 = v6;
              v49 = self;
              id v51 = v47;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                if (v46)
                {
                  id v88 = objc_alloc(MEMORY[0x1E4F28C58]);
                  uint64_t v106 = *MEMORY[0x1E4F502C8];
                  uint64_t v115 = *MEMORY[0x1E4F28568];
                  v89 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"distanceBucketFromSchool"];
                  v116 = v89;
                  v90 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v116 forKeys:&v115 count:1];
                  id *v46 = (id)[v88 initWithDomain:v106 code:2 userInfo:v90];
                }
                v50 = 0;
                a4 = 0;
                v23 = v107;
                v18 = v108;
                int v10 = v109;
                goto LABEL_74;
              }
              v48 = v6;
              v49 = self;
              id v51 = [NSNumber numberWithInt:BMLocationHashedCoordinatesDistanceRangeFromString(v47)];
            }
            v50 = v51;
          }
          else
          {
            v48 = v6;
            v49 = self;
            v50 = 0;
          }
          uint64_t v52 = [v112 intValue];
          uint64_t v53 = [v110 intValue];
          unsigned int v54 = [v15 intValue];
          id v55 = v15;
          unsigned int v56 = [v103 intValue];
          unsigned int v57 = [v102 intValue];
          unint64_t v95 = __PAIR64__([v50 intValue], v57);
          unint64_t v93 = __PAIR64__(v56, v54);
          id v15 = v55;
          v23 = v107;
          v18 = v108;
          a4 = -[BMLocationHashedCoordinates initWithLocationHashAt300Meters:locationHashAt2500Meters:locationHashAt156Kilometers:floor:speedBucket:altitudeBucket:distanceBucketFromHome:distanceBucketFromWork:distanceBucketFromGym:distanceBucketFromSchool:](v49, "initWithLocationHashAt300Meters:locationHashAt2500Meters:locationHashAt156Kilometers:floor:speedBucket:altitudeBucket:distanceBucketFromHome:distanceBucketFromWork:distanceBucketFromGym:distanceBucketFromSchool:", v113, v108, v107, v111, v52, v53, v93, v95);
          self = (BMLocationHashedCoordinates *)a4;
          uint64_t v6 = v48;
          uint64_t v7 = v105;
          int v10 = v109;
          id v5 = v96;
LABEL_74:

          v45 = v97;
LABEL_75:

          uint64_t v8 = v98;
LABEL_76:

LABEL_77:
LABEL_78:

LABEL_79:
          goto LABEL_80;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v103 = v43;
          goto LABEL_53;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v103 = [NSNumber numberWithInt:BMLocationHashedCoordinatesDistanceRangeFromString(v43)];
          goto LABEL_53;
        }
        if (a4)
        {
          id v78 = objc_alloc(MEMORY[0x1E4F28C58]);
          v79 = a4;
          uint64_t v80 = *MEMORY[0x1E4F502C8];
          uint64_t v119 = *MEMORY[0x1E4F28568];
          id v102 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"distanceBucketFromWork"];
          id v120 = v102;
          v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v120 forKeys:&v119 count:1];
          id v81 = (id)[v78 initWithDomain:v80 code:2 userInfo:v45];
          id v103 = 0;
          a4 = 0;
          id *v79 = v81;
          v23 = v107;
          v18 = v108;
          int v10 = v109;
          goto LABEL_75;
        }
        id v103 = 0;
        v18 = v108;
LABEL_106:
        v23 = v107;
        int v10 = v109;
        goto LABEL_76;
      }
      if (a4)
      {
        id v72 = objc_alloc(MEMORY[0x1E4F28C58]);
        v73 = v8;
        uint64_t v74 = *MEMORY[0x1E4F502C8];
        uint64_t v121 = *MEMORY[0x1E4F28568];
        v75 = a4;
        id v103 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"distanceBucketFromHome"];
        id v122 = v103;
        uint64_t v76 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v122 forKeys:&v121 count:1];
        uint64_t v77 = v74;
        uint64_t v8 = v73;
        v99 = (void *)v76;
        id v15 = 0;
        a4 = 0;
        id *v75 = (id)objc_msgSend(v72, "initWithDomain:code:userInfo:", v77, 2);
        uint64_t v7 = v105;
        v18 = v108;
        goto LABEL_106;
      }
      id v15 = 0;
LABEL_104:
      v23 = v107;
      v18 = v108;
      int v10 = v109;
      goto LABEL_77;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v110 = v14;
      goto LABEL_19;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v110 = [NSNumber numberWithInt:BMLocationHashedCoordinatesAltitudeRangeFromString(v14)];
      goto LABEL_19;
    }
    if (a4)
    {
      id v66 = objc_alloc(MEMORY[0x1E4F28C58]);
      v67 = a4;
      v68 = v8;
      uint64_t v69 = *MEMORY[0x1E4F502C8];
      uint64_t v123 = *MEMORY[0x1E4F28568];
      id v15 = (id)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber (corresponding to enum value), or NSString (string version of enum)", objc_opt_class(), @"altitudeBucket"];
      id v124 = v15;
      uint64_t v70 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v124 forKeys:&v123 count:1];
      uint64_t v71 = v69;
      uint64_t v8 = v68;
      v100 = (void *)v70;
      id v110 = 0;
      a4 = 0;
      id *v67 = (id)objc_msgSend(v66, "initWithDomain:code:userInfo:", v71, 2);
      goto LABEL_104;
    }
    id v110 = 0;
LABEL_102:
    uint64_t v7 = v105;
    v23 = v107;
    v18 = v108;
    int v10 = v109;
    goto LABEL_78;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v113 = v6;
    goto LABEL_4;
  }
  if (a4)
  {
    id v16 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v17 = *MEMORY[0x1E4F502C8];
    uint64_t v133 = *MEMORY[0x1E4F28568];
    v18 = (void *)[[NSString alloc] initWithFormat:@"Unexpected type %@ for element of %@, expecting NSNumber", objc_opt_class(), @"locationHashAt300Meters"];
    v134[0] = v18;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v134 forKeys:&v133 count:1];
    id v19 = (id)[v16 initWithDomain:v17 code:2 userInfo:v7];
    id v113 = 0;
    v20 = a4;
    a4 = 0;
    id *v20 = v19;
LABEL_82:

    goto LABEL_83;
  }
  id v113 = 0;
LABEL_83:

  return (BMLocationHashedCoordinates *)a4;
}

- (id)serialize
{
  uint64_t v3 = objc_opt_new();
  [(BMLocationHashedCoordinates *)self writeTo:v3];
  uint64_t v4 = [v3 immutableData];

  return v4;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_hasLocationHashAt300Meters) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_hasLocationHashAt2500Meters) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_hasLocationHashAt156Kilometers) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_hasFloor) {
    PBDataWriterWriteInt32Field();
  }
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
}

- (id)initByReadFrom:(id)a3
{
  id v4 = a3;
  v92.receiver = self;
  v92.super_class = (Class)BMLocationHashedCoordinates;
  id v5 = [(BMEventBase *)&v92 init];
  if (!v5) {
    goto LABEL_149;
  }
  uint64_t v6 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v7 = (int *)MEMORY[0x1E4F940E0];
  uint64_t v8 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)&v4[*MEMORY[0x1E4F940E8]] < *(void *)&v4[*MEMORY[0x1E4F940E0]])
  {
    uint64_t v9 = &OBJC_IVAR___BMDeviceAdaptiveVolume__drumdBK;
    int v10 = &OBJC_IVAR___BMDeviceAdaptiveVolume__drumdBK;
    uint64_t v11 = (int *)MEMORY[0x1E4F940B8];
    uint64_t v12 = &OBJC_IVAR___BMDeviceAdaptiveVolume__drumdBK;
    uint64_t v13 = &OBJC_IVAR___BMDeviceAdaptiveVolume__drumdBK;
    uint64_t v14 = &OBJC_IVAR___BMDeviceAdaptiveVolume__drumdBK;
    id v15 = &OBJC_IVAR___BMDeviceAdaptiveVolume__drumdBK;
    id v16 = &OBJC_IVAR___BMDeviceAdaptiveVolume__drumdBK;
    uint64_t v17 = &OBJC_IVAR___BMDeviceAdaptiveVolume__drumdBK;
    v18 = &OBJC_IVAR___BMDeviceAdaptiveVolume__drumdBK;
    id v19 = &OBJC_IVAR___BMDeviceAdaptiveVolume__drumdBK;
    do
    {
      if (v4[*v8]) {
        break;
      }
      char v20 = 0;
      unsigned int v21 = 0;
      unint64_t v22 = 0;
      while (1)
      {
        uint64_t v23 = *v6;
        unint64_t v24 = *(void *)&v4[v23];
        if (v24 == -1 || v24 >= *(void *)&v4[*v7]) {
          break;
        }
        char v25 = *(unsigned char *)(*(void *)&v4[*v11] + v24);
        *(void *)&v4[v23] = v24 + 1;
        v22 |= (unint64_t)(v25 & 0x7F) << v20;
        if ((v25 & 0x80) == 0) {
          goto LABEL_13;
        }
        v20 += 7;
        BOOL v26 = v21++ >= 9;
        if (v26)
        {
          unint64_t v22 = 0;
          int v27 = v4[*v8];
          goto LABEL_15;
        }
      }
      v4[*v8] = 1;
LABEL_13:
      int v27 = v4[*v8];
      if (v4[*v8]) {
        unint64_t v22 = 0;
      }
LABEL_15:
      if (v27 || (v22 & 7) == 4) {
        break;
      }
      switch((v22 >> 3))
      {
        case 1u:
          char v29 = 0;
          unsigned int v30 = 0;
          unint64_t v31 = 0;
          *((unsigned char *)&v5->super.super.isa + v9[176]) = 1;
          while (1)
          {
            uint64_t v32 = *v6;
            unint64_t v33 = *(void *)&v4[v32];
            if (v33 == -1 || v33 >= *(void *)&v4[*v7]) {
              break;
            }
            char v34 = *(unsigned char *)(*(void *)&v4[*v11] + v33);
            *(void *)&v4[v32] = v33 + 1;
            v31 |= (unint64_t)(v34 & 0x7F) << v29;
            if ((v34 & 0x80) == 0) {
              goto LABEL_93;
            }
            v29 += 7;
            BOOL v26 = v30++ >= 9;
            if (v26)
            {
              unint64_t v31 = 0;
              goto LABEL_95;
            }
          }
          v4[*v8] = 1;
LABEL_93:
          if (v4[*v8]) {
            unint64_t v31 = 0;
          }
LABEL_95:
          uint64_t v88 = v10[177];
          goto LABEL_104;
        case 2u:
          char v35 = 0;
          unsigned int v36 = 0;
          unint64_t v31 = 0;
          *((unsigned char *)&v5->super.super.isa + v12[178]) = 1;
          while (2)
          {
            uint64_t v37 = *v6;
            unint64_t v38 = *(void *)&v4[v37];
            if (v38 == -1 || v38 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v39 = *(unsigned char *)(*(void *)&v4[*v11] + v38);
              *(void *)&v4[v37] = v38 + 1;
              v31 |= (unint64_t)(v39 & 0x7F) << v35;
              if (v39 < 0)
              {
                v35 += 7;
                BOOL v26 = v36++ >= 9;
                if (v26)
                {
                  unint64_t v31 = 0;
                  goto LABEL_99;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            unint64_t v31 = 0;
          }
LABEL_99:
          uint64_t v88 = v13[179];
          goto LABEL_104;
        case 3u:
          char v40 = 0;
          unsigned int v41 = 0;
          unint64_t v31 = 0;
          *((unsigned char *)&v5->super.super.isa + v14[180]) = 1;
          while (2)
          {
            uint64_t v42 = *v6;
            unint64_t v43 = *(void *)&v4[v42];
            if (v43 == -1 || v43 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v44 = *(unsigned char *)(*(void *)&v4[*v11] + v43);
              *(void *)&v4[v42] = v43 + 1;
              v31 |= (unint64_t)(v44 & 0x7F) << v40;
              if (v44 < 0)
              {
                v40 += 7;
                BOOL v26 = v41++ >= 9;
                if (v26)
                {
                  unint64_t v31 = 0;
                  goto LABEL_103;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            unint64_t v31 = 0;
          }
LABEL_103:
          uint64_t v88 = v15[181];
LABEL_104:
          *(Class *)((char *)&v5->super.super.isa + v88) = (Class)v31;
          continue;
        case 8u:
          char v51 = 0;
          unsigned int v52 = 0;
          uint64_t v53 = 0;
          *((unsigned char *)&v5->super.super.isa + v16[182]) = 1;
          while (2)
          {
            uint64_t v54 = *v6;
            unint64_t v55 = *(void *)&v4[v54];
            if (v55 == -1 || v55 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v56 = *(unsigned char *)(*(void *)&v4[*v11] + v55);
              *(void *)&v4[v54] = v55 + 1;
              v53 |= (unint64_t)(v56 & 0x7F) << v51;
              if (v56 < 0)
              {
                v51 += 7;
                BOOL v26 = v52++ >= 9;
                if (v26)
                {
                  LODWORD(v53) = 0;
                  goto LABEL_108;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v53) = 0;
          }
LABEL_108:
          *(_DWORD *)((char *)&v5->super.super.isa + v17[183]) = v53;
          continue;
        case 9u:
          char v57 = 0;
          unsigned int v58 = 0;
          uint64_t v59 = 0;
          while (2)
          {
            uint64_t v60 = *v6;
            unint64_t v61 = *(void *)&v4[v60];
            if (v61 == -1 || v61 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v62 = *(unsigned char *)(*(void *)&v4[*v11] + v61);
              *(void *)&v4[v60] = v61 + 1;
              v59 |= (unint64_t)(v62 & 0x7F) << v57;
              if (v62 < 0)
              {
                v57 += 7;
                BOOL v26 = v58++ >= 9;
                if (v26)
                {
                  LODWORD(v59) = 0;
                  goto LABEL_112;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v59) = 0;
          }
LABEL_112:
          if (v59 >= 0xB) {
            LODWORD(v59) = 0;
          }
          uint64_t v89 = v18[184];
          goto LABEL_145;
        case 0xAu:
          char v63 = 0;
          unsigned int v64 = 0;
          uint64_t v59 = 0;
          while (2)
          {
            uint64_t v65 = *v6;
            unint64_t v66 = *(void *)&v4[v65];
            if (v66 == -1 || v66 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v67 = *(unsigned char *)(*(void *)&v4[*v11] + v66);
              *(void *)&v4[v65] = v66 + 1;
              v59 |= (unint64_t)(v67 & 0x7F) << v63;
              if (v67 < 0)
              {
                v63 += 7;
                BOOL v26 = v64++ >= 9;
                if (v26)
                {
                  LODWORD(v59) = 0;
                  goto LABEL_118;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v59) = 0;
          }
LABEL_118:
          if (v59 >= 0xA) {
            LODWORD(v59) = 0;
          }
          uint64_t v89 = v19[185];
          goto LABEL_145;
        case 0xBu:
          char v68 = 0;
          unsigned int v69 = 0;
          uint64_t v59 = 0;
          while (2)
          {
            uint64_t v70 = *v6;
            unint64_t v71 = *(void *)&v4[v70];
            if (v71 == -1 || v71 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v72 = *(unsigned char *)(*(void *)&v4[*v11] + v71);
              *(void *)&v4[v70] = v71 + 1;
              v59 |= (unint64_t)(v72 & 0x7F) << v68;
              if (v72 < 0)
              {
                v68 += 7;
                BOOL v26 = v69++ >= 9;
                if (v26)
                {
                  LODWORD(v59) = 0;
                  goto LABEL_124;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v59) = 0;
          }
LABEL_124:
          if (v59 >= 0xA) {
            LODWORD(v59) = 0;
          }
          uint64_t v89 = 40;
          goto LABEL_145;
        case 0xCu:
          char v73 = 0;
          unsigned int v74 = 0;
          uint64_t v59 = 0;
          while (2)
          {
            uint64_t v75 = *v6;
            unint64_t v76 = *(void *)&v4[v75];
            if (v76 == -1 || v76 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v77 = *(unsigned char *)(*(void *)&v4[*v11] + v76);
              *(void *)&v4[v75] = v76 + 1;
              v59 |= (unint64_t)(v77 & 0x7F) << v73;
              if (v77 < 0)
              {
                v73 += 7;
                BOOL v26 = v74++ >= 9;
                if (v26)
                {
                  LODWORD(v59) = 0;
                  goto LABEL_130;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v59) = 0;
          }
LABEL_130:
          if (v59 >= 0xA) {
            LODWORD(v59) = 0;
          }
          uint64_t v89 = 44;
          goto LABEL_145;
        case 0xDu:
          char v78 = 0;
          unsigned int v79 = 0;
          uint64_t v59 = 0;
          while (2)
          {
            uint64_t v80 = *v6;
            unint64_t v81 = *(void *)&v4[v80];
            if (v81 == -1 || v81 >= *(void *)&v4[*v7])
            {
              v4[*v8] = 1;
            }
            else
            {
              char v82 = *(unsigned char *)(*(void *)&v4[*v11] + v81);
              *(void *)&v4[v80] = v81 + 1;
              v59 |= (unint64_t)(v82 & 0x7F) << v78;
              if (v82 < 0)
              {
                v78 += 7;
                BOOL v26 = v79++ >= 9;
                if (v26)
                {
                  LODWORD(v59) = 0;
                  goto LABEL_136;
                }
                continue;
              }
            }
            break;
          }
          if (v4[*v8]) {
            LODWORD(v59) = 0;
          }
LABEL_136:
          if (v59 >= 0xA) {
            LODWORD(v59) = 0;
          }
          uint64_t v89 = 48;
          goto LABEL_145;
        case 0xEu:
          char v83 = 0;
          unsigned int v84 = 0;
          uint64_t v59 = 0;
          break;
        default:
          v45 = v9;
          v46 = v10;
          v47 = v12;
          v48 = v13;
          v49 = v14;
          int v50 = PBReaderSkipValueWithTag();
          uint64_t v8 = (int *)MEMORY[0x1E4F940C8];
          uint64_t v14 = v49;
          id v15 = &OBJC_IVAR___BMDeviceAdaptiveVolume__drumdBK;
          uint64_t v13 = v48;
          id v16 = &OBJC_IVAR___BMDeviceAdaptiveVolume__drumdBK;
          uint64_t v12 = v47;
          v18 = &OBJC_IVAR___BMDeviceAdaptiveVolume__drumdBK;
          int v10 = v46;
          uint64_t v17 = &OBJC_IVAR___BMDeviceAdaptiveVolume__drumdBK;
          uint64_t v9 = v45;
          id v19 = &OBJC_IVAR___BMDeviceAdaptiveVolume__drumdBK;
          if (!v50) {
            goto LABEL_148;
          }
          continue;
      }
      while (1)
      {
        uint64_t v85 = *v6;
        unint64_t v86 = *(void *)&v4[v85];
        if (v86 == -1 || v86 >= *(void *)&v4[*v7]) {
          break;
        }
        char v87 = *(unsigned char *)(*(void *)&v4[*v11] + v86);
        *(void *)&v4[v85] = v86 + 1;
        v59 |= (unint64_t)(v87 & 0x7F) << v83;
        if ((v87 & 0x80) == 0) {
          goto LABEL_140;
        }
        v83 += 7;
        BOOL v26 = v84++ >= 9;
        if (v26)
        {
          LODWORD(v59) = 0;
          goto LABEL_142;
        }
      }
      v4[*v8] = 1;
LABEL_140:
      if (v4[*v8]) {
        LODWORD(v59) = 0;
      }
LABEL_142:
      if (v59 >= 0xA) {
        LODWORD(v59) = 0;
      }
      uint64_t v89 = 52;
LABEL_145:
      *(_DWORD *)((char *)&v5->super.super.isa + v89) = v59;
    }
    while (*(void *)&v4[*v6] < *(void *)&v4[*v7]);
  }
  if (v4[*v8]) {
LABEL_148:
  }
    v90 = 0;
  else {
LABEL_149:
  }
    v90 = v5;

  return v90;
}

- (NSString)description
{
  id v14 = [NSString alloc];
  uint64_t v3 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[BMLocationHashedCoordinates locationHashAt300Meters](self, "locationHashAt300Meters"));
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[BMLocationHashedCoordinates locationHashAt2500Meters](self, "locationHashAt2500Meters"));
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[BMLocationHashedCoordinates locationHashAt156Kilometers](self, "locationHashAt156Kilometers"));
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithInt:", -[BMLocationHashedCoordinates floor](self, "floor"));
  uint64_t v7 = BMLocationHashedCoordinatesSpeedRangeAsString([(BMLocationHashedCoordinates *)self speedBucket]);
  uint64_t v8 = BMLocationHashedCoordinatesAltitudeRangeAsString([(BMLocationHashedCoordinates *)self altitudeBucket]);
  uint64_t v9 = BMLocationHashedCoordinatesDistanceRangeAsString([(BMLocationHashedCoordinates *)self distanceBucketFromHome]);
  int v10 = BMLocationHashedCoordinatesDistanceRangeAsString([(BMLocationHashedCoordinates *)self distanceBucketFromWork]);
  uint64_t v11 = BMLocationHashedCoordinatesDistanceRangeAsString([(BMLocationHashedCoordinates *)self distanceBucketFromGym]);
  uint64_t v12 = BMLocationHashedCoordinatesDistanceRangeAsString([(BMLocationHashedCoordinates *)self distanceBucketFromSchool]);
  id v15 = (id)[v14 initWithFormat:@"BMLocationHashedCoordinates with locationHashAt300Meters: %@, locationHashAt2500Meters: %@, locationHashAt156Kilometers: %@, floor: %@, speedBucket: %@, altitudeBucket: %@, distanceBucketFromHome: %@, distanceBucketFromWork: %@, distanceBucketFromGym: %@, distanceBucketFromSchool: %@", v3, v4, v5, v6, v7, v8, v9, v10, v11, v12];

  return (NSString *)v15;
}

- (BMLocationHashedCoordinates)initWithLocationHashAt300Meters:(id)a3 locationHashAt2500Meters:(id)a4 locationHashAt156Kilometers:(id)a5 floor:(id)a6 speedBucket:(int)a7 altitudeBucket:(int)a8 distanceBucketFromHome:(int)a9 distanceBucketFromWork:(int)a10 distanceBucketFromGym:(int)a11 distanceBucketFromSchool:(int)a12
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v21 = a6;
  v28.receiver = self;
  v28.super_class = (Class)BMLocationHashedCoordinates;
  unint64_t v22 = [(BMEventBase *)&v28 init];
  if (v22)
  {
    v22->_dataVersion = [(id)objc_opt_class() latestDataVersion];
    if (v18)
    {
      v22->_hasLocationHashAt300Meters = 1;
      uint64_t v23 = [v18 unsignedLongLongValue];
    }
    else
    {
      uint64_t v23 = 0;
      v22->_hasLocationHashAt300Meters = 0;
    }
    v22->_locationHashAt300Meters = v23;
    if (v19)
    {
      v22->_hasLocationHashAt2500Meters = 1;
      uint64_t v24 = [v19 unsignedLongLongValue];
    }
    else
    {
      uint64_t v24 = 0;
      v22->_hasLocationHashAt2500Meters = 0;
    }
    v22->_locationHashAt2500Meters = v24;
    if (v20)
    {
      v22->_hasLocationHashAt156Kilometers = 1;
      uint64_t v25 = [v20 unsignedLongLongValue];
    }
    else
    {
      uint64_t v25 = 0;
      v22->_hasLocationHashAt156Kilometers = 0;
    }
    v22->_locationHashAt156Kilometers = v25;
    if (v21)
    {
      v22->_hasFloor = 1;
      int v26 = [v21 intValue];
    }
    else
    {
      v22->_hasFloor = 0;
      int v26 = -1;
    }
    v22->_floor = v26;
    v22->_speedBucket = a7;
    v22->_altitudeBucket = a8;
    v22->_distanceBucketFromHome = a9;
    v22->_distanceBucketFromWork = a10;
    v22->_distanceBucketFromGym = a11;
    v22->_distanceBucketFromSchool = a12;
  }

  return v22;
}

+ (id)protoFields
{
  v18[14] = *MEMORY[0x1E4F143B8];
  uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"locationHashAt300Meters" number:1 type:5 subMessageClass:0];
  v18[0] = v17;
  id v16 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"locationHashAt2500Meters" number:2 type:5 subMessageClass:0];
  v18[1] = v16;
  id v15 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"locationHashAt156Kilometers" number:3 type:5 subMessageClass:0];
  v18[2] = v15;
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"distanceFromHomeOfCurrentLocationInMeters" number:4 type:1 subMessageClass:0];
  v18[3] = v14;
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"distanceFromWorkOfCurrentLocationInMeters" number:5 type:1 subMessageClass:0];
  v18[4] = v13;
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"distanceFromSchoolOfCurrentLocationInMeters" number:6 type:1 subMessageClass:0];
  v18[5] = v2;
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"distanceFromGymOfCurrentLocationInMeters" number:7 type:1 subMessageClass:0];
  v18[6] = v3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"floor" number:8 type:2 subMessageClass:0];
  v18[7] = v4;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"speedBucket" number:9 type:4 subMessageClass:0];
  v18[8] = v5;
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"altitudeBucket" number:10 type:4 subMessageClass:0];
  v18[9] = v6;
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"distanceBucketFromHome" number:11 type:4 subMessageClass:0];
  v18[10] = v7;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"distanceBucketFromWork" number:12 type:4 subMessageClass:0];
  v18[11] = v8;
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"distanceBucketFromGym" number:13 type:4 subMessageClass:0];
  v18[12] = v9;
  int v10 = (void *)[objc_alloc(MEMORY[0x1E4F503E0]) initWithName:@"distanceBucketFromSchool" number:14 type:4 subMessageClass:0];
  v18[13] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:14];

  return v11;
}

+ (id)validKeyPaths
{
  return &unk_1F0BF3768;
}

+ (id)columns
{
  v18[14] = *MEMORY[0x1E4F143B8];
  uint64_t v17 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"locationHashAt300Meters" dataType:0 requestOnly:0 fieldNumber:1 protoDataType:5 convertedType:0];
  id v16 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"locationHashAt2500Meters" dataType:0 requestOnly:0 fieldNumber:2 protoDataType:5 convertedType:0];
  id v15 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"locationHashAt156Kilometers" dataType:0 requestOnly:0 fieldNumber:3 protoDataType:5 convertedType:0];
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"distanceFromHomeOfCurrentLocationInMeters" dataType:1 requestOnly:0 fieldNumber:4 protoDataType:1 convertedType:0];
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"distanceFromWorkOfCurrentLocationInMeters" dataType:1 requestOnly:0 fieldNumber:5 protoDataType:1 convertedType:0];
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"distanceFromSchoolOfCurrentLocationInMeters" dataType:1 requestOnly:0 fieldNumber:6 protoDataType:1 convertedType:0];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"distanceFromGymOfCurrentLocationInMeters" dataType:1 requestOnly:0 fieldNumber:7 protoDataType:1 convertedType:0];
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"floor" dataType:0 requestOnly:0 fieldNumber:8 protoDataType:2 convertedType:0];
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"speedBucket" dataType:0 requestOnly:0 fieldNumber:9 protoDataType:4 convertedType:0];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"altitudeBucket" dataType:0 requestOnly:0 fieldNumber:10 protoDataType:4 convertedType:0];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"distanceBucketFromHome" dataType:0 requestOnly:0 fieldNumber:11 protoDataType:4 convertedType:0];
  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"distanceBucketFromWork" dataType:0 requestOnly:0 fieldNumber:12 protoDataType:4 convertedType:0];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"distanceBucketFromGym" dataType:0 requestOnly:0 fieldNumber:13 protoDataType:4 convertedType:0];
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F50420]) initWithName:@"distanceBucketFromSchool" dataType:0 requestOnly:0 fieldNumber:14 protoDataType:4 convertedType:0];
  v18[0] = v17;
  v18[1] = v16;
  v18[2] = v15;
  v18[3] = v14;
  v18[4] = v2;
  v18[5] = v3;
  v18[6] = v4;
  v18[7] = v5;
  v18[8] = v13;
  v18[9] = v6;
  v18[10] = v7;
  v18[11] = v12;
  v18[12] = v8;
  v18[13] = v9;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:14];

  return v11;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  if (a4)
  {
    id v4 = 0;
  }
  else
  {
    id v5 = (objc_class *)MEMORY[0x1E4F94090];
    id v6 = a3;
    uint64_t v7 = (void *)[[v5 alloc] initWithData:v6];

    uint64_t v8 = [[BMLocationHashedCoordinates alloc] initByReadFrom:v7];
    id v4 = v8;
    if (v8) {
      v8[6] = 0;
    }
  }

  return v4;
}

+ (unsigned)latestDataVersion
{
  return 0;
}

- (BMLocationHashedCoordinates)initWithLocationHashAt300Meters:(id)a3 locationHashAt2500Meters:(id)a4 locationHashAt156Kilometers:(id)a5 distanceFromHomeOfCurrentLocationInMeters:(id)a6 distanceFromWorkOfCurrentLocationInMeters:(id)a7 distanceFromSchoolOfCurrentLocationInMeters:(id)a8 distanceFromGymOfCurrentLocationInMeters:(id)a9 floor:(id)a10 speedBucket:(int)a11 altitudeBucket:(int)a12 distanceBucketFromHome:(int)a13 distanceBucketFromWork:(int)a14 distanceBucketFromGym:(int)a15 distanceBucketFromSchool:(int)a16
{
  return -[BMLocationHashedCoordinates initWithLocationHashAt300Meters:locationHashAt2500Meters:locationHashAt156Kilometers:floor:speedBucket:altitudeBucket:distanceBucketFromHome:distanceBucketFromWork:distanceBucketFromGym:distanceBucketFromSchool:](self, "initWithLocationHashAt300Meters:locationHashAt2500Meters:locationHashAt156Kilometers:floor:speedBucket:altitudeBucket:distanceBucketFromHome:distanceBucketFromWork:distanceBucketFromGym:distanceBucketFromSchool:", a3, a4, a5, a10, a11, a12);
}

- (BMLocationHashedCoordinates)initWithLocationHashAt300Meters:(id)a3 locationHashAt2500Meters:(id)a4 locationHashAt156Kilometers:(id)a5 distanceFromHomeOfCurrentLocationInMeters:(id)a6 distanceFromWorkOfCurrentLocationInMeters:(id)a7 distanceFromSchoolOfCurrentLocationInMeters:(id)a8 distanceFromGymOfCurrentLocationInMeters:(id)a9 floor:(id)a10 speedBucket:(int)a11 altitudeBucket:(int)a12
{
  return -[BMLocationHashedCoordinates initWithLocationHashAt300Meters:locationHashAt2500Meters:locationHashAt156Kilometers:distanceFromHomeOfCurrentLocationInMeters:distanceFromWorkOfCurrentLocationInMeters:distanceFromSchoolOfCurrentLocationInMeters:distanceFromGymOfCurrentLocationInMeters:floor:speedBucket:altitudeBucket:distanceBucketFromHome:distanceBucketFromWork:distanceBucketFromGym:distanceBucketFromSchool:](self, "initWithLocationHashAt300Meters:locationHashAt2500Meters:locationHashAt156Kilometers:distanceFromHomeOfCurrentLocationInMeters:distanceFromWorkOfCurrentLocationInMeters:distanceFromSchoolOfCurrentLocationInMeters:distanceFromGymOfCurrentLocationInMeters:floor:speedBucket:altitudeBucket:distanceBucketFromHome:distanceBucketFromWork:distanceBucketFromGym:distanceBucketFromSchool:", a3, a4, a5, 0, 0, 0, 0, a10, __PAIR64__(a12, a11), 0, 0);
}

@end