@interface IPCTrafficIncidentAlertMessage
- (GEORouteIncident)incident;
- (IPCTrafficIncidentAlertMessage)initWithDictionary:(id)a3;
- (NSString)identifier;
- (NSString)subtitle;
- (NSString)title;
- (id)description;
- (id)dictionaryValue;
- (unint64_t)type;
- (void)setIdentifier:(id)a3;
- (void)setIncident:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation IPCTrafficIncidentAlertMessage

- (IPCTrafficIncidentAlertMessage)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IPCTrafficIncidentAlertMessage;
  v5 = [(IPCMessageObject *)&v12 initWithDictionary:v4];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"kIPCTrafficIncidentAlertMessageTypeKey"];
    -[IPCTrafficIncidentAlertMessage setType:](v5, "setType:", [v6 unsignedIntegerValue]);

    v7 = [v4 objectForKeyedSubscript:@"kIPCTrafficIncidentAlertMessageTitleKey"];
    [(IPCTrafficIncidentAlertMessage *)v5 setTitle:v7];

    v8 = [v4 objectForKeyedSubscript:@"kIPCTrafficIncidentAlertMessageSubtitleKey"];
    [(IPCTrafficIncidentAlertMessage *)v5 setSubtitle:v8];

    v9 = [v4 objectForKeyedSubscript:@"kIPCTrafficIncidentAlertMessageIdentifierKey"];
    [(IPCTrafficIncidentAlertMessage *)v5 setIdentifier:v9];

    v10 = [v4 objectForKeyedSubscript:@"kIPCTrafficIncidentAlertMessageIncidentKey"];
    [(IPCTrafficIncidentAlertMessage *)v5 setIncident:v10];
  }
  return v5;
}

- (id)dictionaryValue
{
  v16.receiver = self;
  v16.super_class = (Class)IPCTrafficIncidentAlertMessage;
  v3 = [(IPCMessageObject *)&v16 dictionaryValue];
  id v4 = [v3 mutableCopy];

  v5 = +[NSNumber numberWithUnsignedInteger:[(IPCTrafficIncidentAlertMessage *)self type]];
  [v4 setObject:v5 forKeyedSubscript:@"kIPCTrafficIncidentAlertMessageTypeKey"];

  v6 = [(IPCTrafficIncidentAlertMessage *)self title];
  id v7 = [v6 copy];
  [v4 setObject:v7 forKeyedSubscript:@"kIPCTrafficIncidentAlertMessageTitleKey"];

  v8 = [(IPCTrafficIncidentAlertMessage *)self subtitle];
  id v9 = [v8 copy];
  [v4 setObject:v9 forKeyedSubscript:@"kIPCTrafficIncidentAlertMessageSubtitleKey"];

  v10 = [(IPCTrafficIncidentAlertMessage *)self identifier];
  id v11 = [v10 copy];
  [v4 setObject:v11 forKeyedSubscript:@"kIPCTrafficIncidentAlertMessageIdentifierKey"];

  objc_super v12 = [(IPCTrafficIncidentAlertMessage *)self incident];
  id v13 = [v12 copy];
  [v4 setObject:v13 forKeyedSubscript:@"kIPCTrafficIncidentAlertMessageIncidentKey"];

  id v14 = [v4 copy];

  return v14;
}

- (id)description
{
  v11.receiver = self;
  v11.super_class = (Class)IPCTrafficIncidentAlertMessage;
  v3 = [(IPCTrafficIncidentAlertMessage *)&v11 description];
  id v4 = +[NSNumber numberWithUnsignedInteger:[(IPCTrafficIncidentAlertMessage *)self type]];
  v5 = [(IPCTrafficIncidentAlertMessage *)self title];
  v6 = [(IPCTrafficIncidentAlertMessage *)self subtitle];
  id v7 = [(IPCTrafficIncidentAlertMessage *)self identifier];
  v8 = [(IPCTrafficIncidentAlertMessage *)self incident];
  id v9 = +[NSString stringWithFormat:@"%@             type : {%@}             title : {%@}             subtitle : {%@}             identifier : {%@}             incident : {%@}", v3, v4, v5, v6, v7, v8];

  return v9;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (GEORouteIncident)incident
{
  return self->_incident;
}

- (void)setIncident:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incident, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end