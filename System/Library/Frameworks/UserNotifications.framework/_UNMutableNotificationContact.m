@interface _UNMutableNotificationContact
- (id)copyWithZone:(_NSZone *)a3;
- (void)setCnContactFullname:(id)a3;
- (void)setCnContactIdentifier:(id)a3;
- (void)setCnContactIdentifierSuggested:(BOOL)a3;
- (void)setCustomIdentifier:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setDisplayNameSuggested:(BOOL)a3;
- (void)setHandle:(id)a3;
- (void)setHandleType:(int64_t)a3;
- (void)setServiceName:(id)a3;
@end

@implementation _UNMutableNotificationContact

- (void)setHandle:(id)a3
{
  self->super._handle = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setHandleType:(int64_t)a3
{
  self->super._handleType = a3;
}

- (void)setServiceName:(id)a3
{
  self->super._serviceName = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setDisplayName:(id)a3
{
  self->super._displayName = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setDisplayNameSuggested:(BOOL)a3
{
  self->super._displayNameSuggested = a3;
}

- (void)setCustomIdentifier:(id)a3
{
  self->super._customIdentifier = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setCnContactIdentifierSuggested:(BOOL)a3
{
  self->super._cnContactIdentifierSuggested = a3;
}

- (void)setCnContactIdentifier:(id)a3
{
  self->super._cnContactIdentifier = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setCnContactFullname:(id)a3
{
  self->super._cnContactFullname = (NSString *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[_UNNotificationContact allocWithZone:a3];
  v5 = [(_UNNotificationContact *)self handle];
  int64_t v6 = [(_UNNotificationContact *)self handleType];
  v7 = [(_UNNotificationContact *)self serviceName];
  v8 = [(_UNNotificationContact *)self displayName];
  BOOL v9 = [(_UNNotificationContact *)self isDisplayNameSuggested];
  v10 = [(_UNNotificationContact *)self customIdentifier];
  v11 = [(_UNNotificationContact *)self cnContactIdentifier];
  v12 = [(_UNNotificationContact *)self cnContactFullname];
  LOBYTE(v15) = [(_UNNotificationContact *)self isCNContactIdentifierSuggested];
  id v13 = [(_UNNotificationContact *)v4 _initWithhandle:v5 handleType:v6 serviceName:v7 displayName:v8 displayNameSuggested:v9 customIdentifier:v10 cnContactIdentifier:v11 cnContactFullname:v12 cnContactIdentifierSuggested:v15];

  return v13;
}

@end