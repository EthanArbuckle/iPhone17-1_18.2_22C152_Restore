@interface _AFHomeAccessorySiriDataSharingChangeLogEventMutation
- (BOOL)isDirty;
- (_AFHomeAccessorySiriDataSharingChangeLogEventMutation)initWithBase:(id)a3;
- (id)getBuildVersion;
- (id)getChangeReason;
- (id)getDate;
- (id)getLogEventIdentifier;
- (id)getProductVersion;
- (id)getSchemaVersion;
- (int64_t)getChangeSource;
- (int64_t)getNewOptInStatus;
- (int64_t)getPreviousOptInStatus;
- (void)setBuildVersion:(id)a3;
- (void)setChangeReason:(id)a3;
- (void)setChangeSource:(int64_t)a3;
- (void)setDate:(id)a3;
- (void)setLogEventIdentifier:(id)a3;
- (void)setNewOptInStatus:(int64_t)a3;
- (void)setPreviousOptInStatus:(int64_t)a3;
- (void)setProductVersion:(id)a3;
- (void)setSchemaVersion:(id)a3;
@end

@implementation _AFHomeAccessorySiriDataSharingChangeLogEventMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logEventIdentifier, 0);
  objc_storeStrong((id *)&self->_schemaVersion, 0);
  objc_storeStrong((id *)&self->_productVersion, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_changeReason, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setLogEventIdentifier:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x201u;
}

- (id)getLogEventIdentifier
{
  if ((*(_WORD *)&self->_mutationFlags & 0x200) != 0)
  {
    v2 = self->_logEventIdentifier;
  }
  else
  {
    v2 = [(AFHomeAccessorySiriDataSharingChangeLogEvent *)self->_base logEventIdentifier];
  }
  return v2;
}

- (void)setSchemaVersion:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x101u;
}

- (id)getSchemaVersion
{
  if ((*(_WORD *)&self->_mutationFlags & 0x100) != 0)
  {
    v2 = self->_schemaVersion;
  }
  else
  {
    v2 = [(AFHomeAccessorySiriDataSharingChangeLogEvent *)self->_base schemaVersion];
  }
  return v2;
}

- (void)setProductVersion:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x81u;
}

- (id)getProductVersion
{
  if ((*(_WORD *)&self->_mutationFlags & 0x80) != 0)
  {
    v2 = self->_productVersion;
  }
  else
  {
    v2 = [(AFHomeAccessorySiriDataSharingChangeLogEvent *)self->_base productVersion];
  }
  return v2;
}

- (void)setBuildVersion:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x41u;
}

- (id)getBuildVersion
{
  if ((*(_WORD *)&self->_mutationFlags & 0x40) != 0)
  {
    v2 = self->_buildVersion;
  }
  else
  {
    v2 = [(AFHomeAccessorySiriDataSharingChangeLogEvent *)self->_base buildVersion];
  }
  return v2;
}

- (void)setChangeReason:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x21u;
}

- (id)getChangeReason
{
  if ((*(_WORD *)&self->_mutationFlags & 0x20) != 0)
  {
    v2 = self->_changeReason;
  }
  else
  {
    v2 = [(AFHomeAccessorySiriDataSharingChangeLogEvent *)self->_base changeReason];
  }
  return v2;
}

- (void)setChangeSource:(int64_t)a3
{
  self->_changeSource = a3;
  *(_WORD *)&self->_mutationFlags |= 0x11u;
}

- (int64_t)getChangeSource
{
  if ((*(_WORD *)&self->_mutationFlags & 0x10) != 0) {
    return self->_changeSource;
  }
  else {
    return [(AFHomeAccessorySiriDataSharingChangeLogEvent *)self->_base changeSource];
  }
}

- (void)setNewOptInStatus:(int64_t)a3
{
  self->_newOptInStatus = a3;
  *(_WORD *)&self->_mutationFlags |= 9u;
}

- (int64_t)getNewOptInStatus
{
  if ((*(_WORD *)&self->_mutationFlags & 8) != 0) {
    return self->_newOptInStatus;
  }
  else {
    return [(AFHomeAccessorySiriDataSharingChangeLogEvent *)self->_base newOptInStatus];
  }
}

- (void)setPreviousOptInStatus:(int64_t)a3
{
  self->_previousOptInStatus = a3;
  *(_WORD *)&self->_mutationFlags |= 5u;
}

- (int64_t)getPreviousOptInStatus
{
  if ((*(_WORD *)&self->_mutationFlags & 4) != 0) {
    return self->_previousOptInStatus;
  }
  else {
    return [(AFHomeAccessorySiriDataSharingChangeLogEvent *)self->_base previousOptInStatus];
  }
}

- (void)setDate:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 3u;
}

- (id)getDate
{
  if ((*(_WORD *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_date;
  }
  else
  {
    v2 = [(AFHomeAccessorySiriDataSharingChangeLogEvent *)self->_base date];
  }
  return v2;
}

- (BOOL)isDirty
{
  return *(_WORD *)&self->_mutationFlags & 1;
}

- (_AFHomeAccessorySiriDataSharingChangeLogEventMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFHomeAccessorySiriDataSharingChangeLogEventMutation;
  v6 = [(_AFHomeAccessorySiriDataSharingChangeLogEventMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end