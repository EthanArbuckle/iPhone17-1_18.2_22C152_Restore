@interface _MPCQCBMSessionTypeInfo
+ (id)infoWithIdentifier:(id)a3 account:(id)a4 supported:(BOOL)a5 supportedReason:(id)a6 exportable:(BOOL)a7 exportableReason:(id)a8;
- (BOOL)exportable;
- (BOOL)supported;
- (MPCPlaybackAccount)account;
- (NSString)exportableReason;
- (NSString)identifier;
- (NSString)supportedReason;
- (void)setAccount:(id)a3;
- (void)setExportable:(BOOL)a3;
- (void)setExportableReason:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setSupported:(BOOL)a3;
- (void)setSupportedReason:(id)a3;
@end

@implementation _MPCQCBMSessionTypeInfo

- (BOOL)supported
{
  return self->_supported;
}

- (NSString)supportedReason
{
  return self->_supportedReason;
}

- (NSString)identifier
{
  return self->_identifier;
}

+ (id)infoWithIdentifier:(id)a3 account:(id)a4 supported:(BOOL)a5 supportedReason:(id)a6 exportable:(BOOL)a7 exportableReason:(id)a8
{
  BOOL v8 = a7;
  BOOL v10 = a5;
  id v13 = a8;
  id v14 = a6;
  id v15 = a4;
  id v16 = a3;
  v17 = objc_alloc_init(_MPCQCBMSessionTypeInfo);
  [(_MPCQCBMSessionTypeInfo *)v17 setIdentifier:v16];

  [(_MPCQCBMSessionTypeInfo *)v17 setAccount:v15];
  [(_MPCQCBMSessionTypeInfo *)v17 setSupported:v10];
  [(_MPCQCBMSessionTypeInfo *)v17 setSupportedReason:v14];

  [(_MPCQCBMSessionTypeInfo *)v17 setExportable:v8];
  [(_MPCQCBMSessionTypeInfo *)v17 setExportableReason:v13];

  return v17;
}

- (void)setSupportedReason:(id)a3
{
}

- (void)setSupported:(BOOL)a3
{
  self->_supported = a3;
}

- (void)setIdentifier:(id)a3
{
}

- (void)setExportableReason:(id)a3
{
}

- (void)setExportable:(BOOL)a3
{
  self->_exportable = a3;
}

- (void)setAccount:(id)a3
{
}

- (BOOL)exportable
{
  return self->_exportable;
}

- (NSString)exportableReason
{
  return self->_exportableReason;
}

- (MPCPlaybackAccount)account
{
  return self->_account;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exportableReason, 0);
  objc_storeStrong((id *)&self->_supportedReason, 0);
  objc_storeStrong((id *)&self->_account, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end