@interface _GDSBalancingAuthorityOutput
- (NSDate)lastUpdatedDate;
- (NSString)identifier;
- (NSString)name;
- (NSUUID)ID;
- (_GDSBalancingAuthorityOutput)initWithID:(id)a3 name:(id)a4 updateDate:(id)a5;
- (_GDSBalancingAuthorityOutput)initWithIdentifier:(id)a3 name:(id)a4 latitudeStart:(double)a5 latitudeEnd:(double)a6 longitudeStart:(double)a7 longitudeEnd:(double)a8 updateDate:(id)a9;
- (double)latEnd;
- (double)latStart;
- (double)longEnd;
- (double)longStart;
@end

@implementation _GDSBalancingAuthorityOutput

- (_GDSBalancingAuthorityOutput)initWithID:(id)a3 name:(id)a4 updateDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)_GDSBalancingAuthorityOutput;
  v11 = [(_GDSBalancingAuthorityOutput *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_name, a4);
    if (v8)
    {
      v13 = (NSUUID *)v8;
    }
    else
    {
      v13 = [MEMORY[0x263F08C38] UUID];
    }
    ID = v12->_ID;
    v12->_ID = v13;

    objc_storeStrong((id *)&v12->_lastUpdatedDate, a5);
  }

  return v12;
}

- (_GDSBalancingAuthorityOutput)initWithIdentifier:(id)a3 name:(id)a4 latitudeStart:(double)a5 latitudeEnd:(double)a6 longitudeStart:(double)a7 longitudeEnd:(double)a8 updateDate:(id)a9
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a9;
  v23.receiver = self;
  v23.super_class = (Class)_GDSBalancingAuthorityOutput;
  v20 = [(_GDSBalancingAuthorityOutput *)&v23 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_name, a4);
    objc_storeStrong((id *)&v21->_identifier, a3);
    v21->_latStart = a5;
    v21->_latEnd = a6;
    v21->_longStart = a7;
    v21->_longEnd = a8;
    objc_storeStrong((id *)&v21->_lastUpdatedDate, a9);
  }

  return v21;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSUUID)ID
{
  return self->_ID;
}

- (NSDate)lastUpdatedDate
{
  return self->_lastUpdatedDate;
}

- (double)latStart
{
  return self->_latStart;
}

- (double)latEnd
{
  return self->_latEnd;
}

- (double)longStart
{
  return self->_longStart;
}

- (double)longEnd
{
  return self->_longEnd;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdatedDate, 0);
  objc_storeStrong((id *)&self->_ID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end