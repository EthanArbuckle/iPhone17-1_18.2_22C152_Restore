@interface RJ39VdykGnvJIRpv
- (NSString)email;
- (NSString)endpointIdentifier;
- (NSString)pEmail;
- (NSString)pPhone;
- (NSString)phone;
- (RJ39VdykGnvJIRpv)initWithDictionary:(id)a3;
- (id)description;
- (id)toDictionary;
- (int)endpointID;
- (n4cyKQis9m01XZsR)name;
- (unint64_t)settingsType;
- (void)setEmail:(id)a3;
- (void)setEndpointID:(int)a3;
- (void)setEndpointIdentifier:(id)a3;
- (void)setName:(id)a3;
- (void)setPEmail:(id)a3;
- (void)setPPhone:(id)a3;
- (void)setPhone:(id)a3;
- (void)setSettingsType:(unint64_t)a3;
@end

@implementation RJ39VdykGnvJIRpv

- (RJ39VdykGnvJIRpv)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"_classType"];
  unsigned int v6 = [v5 isEqualToString:@"settings"];

  if (v6)
  {
    v20.receiver = self;
    v20.super_class = (Class)RJ39VdykGnvJIRpv;
    v7 = [(RJ39VdykGnvJIRpv *)&v20 init];
    if (v7)
    {
      v8 = [v4 objectForKey:@"endpointIdentifier"];
      [(RJ39VdykGnvJIRpv *)v7 setEndpointIdentifier:v8];

      v9 = [v4 objectForKey:@"endpointID"];
      -[RJ39VdykGnvJIRpv setEndpointID:](v7, "setEndpointID:", [v9 intValue]);

      v10 = [v4 objectForKey:@"settingsType"];
      -[RJ39VdykGnvJIRpv setSettingsType:](v7, "setSettingsType:", (int)[v10 intValue]);

      v11 = [v4 objectForKey:@"pEmail"];
      [(RJ39VdykGnvJIRpv *)v7 setPEmail:v11];

      v12 = [v4 objectForKey:@"pPhone"];
      [(RJ39VdykGnvJIRpv *)v7 setPPhone:v12];

      v13 = [v4 objectForKey:@"phone"];
      [(RJ39VdykGnvJIRpv *)v7 setPhone:v13];

      v14 = [v4 objectForKey:@"email"];
      [(RJ39VdykGnvJIRpv *)v7 setEmail:v14];

      v15 = [n4cyKQis9m01XZsR alloc];
      v16 = [v4 objectForKey:@"name"];
      v17 = [(n4cyKQis9m01XZsR *)v15 initWithDictionary:v16];
      [(RJ39VdykGnvJIRpv *)v7 setName:v17];
    }
    self = v7;
    v18 = self;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)toDictionary
{
  v3 = objc_opt_new();
  [v3 setObject:@"settings" forKeyedSubscript:@"_classType"];
  id v4 = +[NSNumber numberWithInt:[(RJ39VdykGnvJIRpv *)self endpointID]];
  [v3 setObject:v4 forKeyedSubscript:@"endpointID"];

  v5 = +[NSNumber numberWithUnsignedInteger:[(RJ39VdykGnvJIRpv *)self settingsType]];
  [v3 setObject:v5 forKeyedSubscript:@"settingsType"];

  unsigned int v6 = [(RJ39VdykGnvJIRpv *)self endpointIdentifier];

  if (v6)
  {
    v7 = [(RJ39VdykGnvJIRpv *)self endpointIdentifier];
    [v3 setObject:v7 forKeyedSubscript:@"endpointIdentifier"];
  }
  v8 = [(RJ39VdykGnvJIRpv *)self pEmail];

  if (v8)
  {
    v9 = [(RJ39VdykGnvJIRpv *)self pEmail];
    [v3 setObject:v9 forKeyedSubscript:@"pEmail"];
  }
  v10 = [(RJ39VdykGnvJIRpv *)self pPhone];

  if (v10)
  {
    v11 = [(RJ39VdykGnvJIRpv *)self pPhone];
    [v3 setObject:v11 forKeyedSubscript:@"pPhone"];
  }
  v12 = [(RJ39VdykGnvJIRpv *)self phone];

  if (v12)
  {
    v13 = [(RJ39VdykGnvJIRpv *)self phone];
    [v3 setObject:v13 forKeyedSubscript:@"phone"];
  }
  v14 = [(RJ39VdykGnvJIRpv *)self email];

  if (v14)
  {
    v15 = [(RJ39VdykGnvJIRpv *)self email];
    [v3 setObject:v15 forKeyedSubscript:@"email"];
  }
  v16 = [(RJ39VdykGnvJIRpv *)self name];
  v17 = [v16 toDictionary];

  if (v17)
  {
    v18 = [(RJ39VdykGnvJIRpv *)self name];
    v19 = [v18 toDictionary];
    [v3 setObject:v19 forKeyedSubscript:@"name"];
  }
  return v3;
}

- (id)description
{
  v3 = +[NSMutableString string];
  [v3 appendFormat:@"<%@, %p> {\n", objc_opt_class(), self];
  id v4 = [(RJ39VdykGnvJIRpv *)self endpointIdentifier];
  [v3 appendFormat:@"\tendpointID: %@\n", v4];

  [v3 appendFormat:@"}"];
  return v3;
}

- (n4cyKQis9m01XZsR)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)phone
{
  return self->_phone;
}

- (void)setPhone:(id)a3
{
}

- (NSString)pPhone
{
  return self->_pPhone;
}

- (void)setPPhone:(id)a3
{
}

- (NSString)pEmail
{
  return self->_pEmail;
}

- (void)setPEmail:(id)a3
{
}

- (NSString)email
{
  return self->_email;
}

- (void)setEmail:(id)a3
{
}

- (NSString)endpointIdentifier
{
  return self->_endpointIdentifier;
}

- (void)setEndpointIdentifier:(id)a3
{
}

- (int)endpointID
{
  return self->_endpointID;
}

- (void)setEndpointID:(int)a3
{
  self->_endpointID = a3;
}

- (unint64_t)settingsType
{
  return self->_settingsType;
}

- (void)setSettingsType:(unint64_t)a3
{
  self->_settingsType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endpointIdentifier, 0);
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_pEmail, 0);
  objc_storeStrong((id *)&self->_pPhone, 0);
  objc_storeStrong((id *)&self->_phone, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end