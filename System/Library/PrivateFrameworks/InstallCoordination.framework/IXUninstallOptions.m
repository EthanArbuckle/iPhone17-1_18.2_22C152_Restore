@interface IXUninstallOptions
+ (BOOL)supportsSecureCoding;
- (BOOL)ignoreAppProtection;
- (BOOL)ignoreRemovability;
- (BOOL)ignoreRestrictions;
- (BOOL)isEqual:(id)a3;
- (BOOL)requestUserConfirmation;
- (BOOL)showArchiveOption;
- (BOOL)showDemotionOption;
- (BOOL)systemAppNotAllowed;
- (BOOL)waitForDeletion;
- (IXUninstallOptions)init;
- (IXUninstallOptions)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setIgnoreAppProtection:(BOOL)a3;
- (void)setIgnoreRemovability:(BOOL)a3;
- (void)setIgnoreRestrictions:(BOOL)a3;
- (void)setRequestUserConfirmation:(BOOL)a3;
- (void)setShowArchiveOption:(BOOL)a3;
- (void)setShowDemotionOption:(BOOL)a3;
- (void)setSystemAppNotAllowed:(BOOL)a3;
- (void)setWaitForDeletion:(BOOL)a3;
@end

@implementation IXUninstallOptions

- (IXUninstallOptions)init
{
  v5.receiver = self;
  v5.super_class = (Class)IXUninstallOptions;
  v2 = [(IXUninstallOptions *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(IXUninstallOptions *)v2 setRequestUserConfirmation:0];
    [(IXUninstallOptions *)v3 setWaitForDeletion:0];
    [(IXUninstallOptions *)v3 setShowArchiveOption:0];
    [(IXUninstallOptions *)v3 setShowDemotionOption:0];
    [(IXUninstallOptions *)v3 setSystemAppNotAllowed:0];
    [(IXUninstallOptions *)v3 setIgnoreRemovability:0];
    [(IXUninstallOptions *)v3 setIgnoreRestrictions:0];
    [(IXUninstallOptions *)v3 setIgnoreAppProtection:0];
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IXUninstallOptions)initWithCoder:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(IXUninstallOptions *)self init];
  if (v5)
  {
    v5->_requestUserConfirmation = [v4 decodeBoolForKey:@"requestUserConfirmation"];
    v5->_waitForDeletion = [v4 decodeBoolForKey:@"waitForDeletion"];
    v5->_showArchiveOption = [v4 decodeBoolForKey:@"showArchiveOption"];
    v5->_showDemotionOption = [v4 decodeBoolForKey:@"showDemotionOption"];
    v5->_systemAppNotAllowed = [v4 decodeBoolForKey:@"systemAppNotAllowed"];
    v5->_ignoreRemovability = [v4 decodeBoolForKey:@"ignoreRemovability"];
    v5->_ignoreRestrictions = [v4 decodeBoolForKey:@"ignoreRestrictions"];
    v5->_ignoreAppProtection = [v4 decodeBoolForKey:@"ignoreAppProtection"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[IXUninstallOptions requestUserConfirmation](self, "requestUserConfirmation"), @"requestUserConfirmation");
  objc_msgSend(v4, "encodeBool:forKey:", -[IXUninstallOptions waitForDeletion](self, "waitForDeletion"), @"waitForDeletion");
  objc_msgSend(v4, "encodeBool:forKey:", -[IXUninstallOptions showArchiveOption](self, "showArchiveOption"), @"showArchiveOption");
  objc_msgSend(v4, "encodeBool:forKey:", -[IXUninstallOptions showDemotionOption](self, "showDemotionOption"), @"showDemotionOption");
  objc_msgSend(v4, "encodeBool:forKey:", -[IXUninstallOptions systemAppNotAllowed](self, "systemAppNotAllowed"), @"systemAppNotAllowed");
  objc_msgSend(v4, "encodeBool:forKey:", -[IXUninstallOptions ignoreRemovability](self, "ignoreRemovability"), @"ignoreRemovability");
  objc_msgSend(v4, "encodeBool:forKey:", -[IXUninstallOptions ignoreRestrictions](self, "ignoreRestrictions"), @"ignoreRestrictions");
  objc_msgSend(v4, "encodeBool:forKey:", -[IXUninstallOptions ignoreAppProtection](self, "ignoreAppProtection"), @"ignoreAppProtection");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setRequestUserConfirmation:", -[IXUninstallOptions requestUserConfirmation](self, "requestUserConfirmation"));
  objc_msgSend(v4, "setWaitForDeletion:", -[IXUninstallOptions waitForDeletion](self, "waitForDeletion"));
  objc_msgSend(v4, "setShowArchiveOption:", -[IXUninstallOptions showArchiveOption](self, "showArchiveOption"));
  objc_msgSend(v4, "setShowDemotionOption:", -[IXUninstallOptions showDemotionOption](self, "showDemotionOption"));
  objc_msgSend(v4, "setSystemAppNotAllowed:", -[IXUninstallOptions systemAppNotAllowed](self, "systemAppNotAllowed"));
  objc_msgSend(v4, "setIgnoreRemovability:", -[IXUninstallOptions ignoreRemovability](self, "ignoreRemovability"));
  objc_msgSend(v4, "setIgnoreRestrictions:", -[IXUninstallOptions ignoreRestrictions](self, "ignoreRestrictions"));
  objc_msgSend(v4, "setIgnoreAppProtection:", -[IXUninstallOptions ignoreAppProtection](self, "ignoreAppProtection"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = (IXUninstallOptions *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v5 = v4;
      BOOL v6 = [(IXUninstallOptions *)self requestUserConfirmation];
      if (v6 != [(IXUninstallOptions *)v5 requestUserConfirmation])
      {
        v7 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = 136315394;
          v19 = "-[IXUninstallOptions isEqual:]";
          __int16 v20 = 2080;
          v21 = "requestUserConfirmation";
LABEL_32:
          _os_log_impl(&dword_1A7B2D000, v7, OS_LOG_TYPE_DEFAULT, "%s: Property %s did not match", (uint8_t *)&v18, 0x16u);
        }
LABEL_33:

        BOOL v8 = 0;
LABEL_34:

        goto LABEL_35;
      }
      BOOL v9 = [(IXUninstallOptions *)self waitForDeletion];
      if (v9 == [(IXUninstallOptions *)v5 waitForDeletion])
      {
        BOOL v10 = [(IXUninstallOptions *)self showArchiveOption];
        if (v10 != [(IXUninstallOptions *)v5 showArchiveOption])
        {
          v7 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            int v18 = 136315394;
            v19 = "-[IXUninstallOptions isEqual:]";
            __int16 v20 = 2080;
            v21 = "showArchiveOption";
            goto LABEL_32;
          }
          goto LABEL_33;
        }
        BOOL v11 = [(IXUninstallOptions *)self showDemotionOption];
        if (v11 != [(IXUninstallOptions *)v5 showDemotionOption])
        {
          v7 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            int v18 = 136315394;
            v19 = "-[IXUninstallOptions isEqual:]";
            __int16 v20 = 2080;
            v21 = "showDemotionOption";
            goto LABEL_32;
          }
          goto LABEL_33;
        }
        BOOL v12 = [(IXUninstallOptions *)self waitForDeletion];
        if (v12 == [(IXUninstallOptions *)v5 waitForDeletion])
        {
          BOOL v13 = [(IXUninstallOptions *)self systemAppNotAllowed];
          if (v13 == [(IXUninstallOptions *)v5 systemAppNotAllowed])
          {
            BOOL v14 = [(IXUninstallOptions *)self ignoreRemovability];
            if (v14 == [(IXUninstallOptions *)v5 ignoreRemovability])
            {
              BOOL v15 = [(IXUninstallOptions *)self ignoreRestrictions];
              if (v15 == [(IXUninstallOptions *)v5 ignoreRestrictions])
              {
                BOOL v16 = [(IXUninstallOptions *)self ignoreAppProtection];
                if (v16 == [(IXUninstallOptions *)v5 ignoreAppProtection])
                {
                  BOOL v8 = 1;
                  goto LABEL_34;
                }
                v7 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
                if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
                {
                  int v18 = 136315394;
                  v19 = "-[IXUninstallOptions isEqual:]";
                  __int16 v20 = 2080;
                  v21 = "ignoreAppProtection";
                  goto LABEL_32;
                }
              }
              else
              {
                v7 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
                if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
                {
                  int v18 = 136315394;
                  v19 = "-[IXUninstallOptions isEqual:]";
                  __int16 v20 = 2080;
                  v21 = "ignoreRestrictions";
                  goto LABEL_32;
                }
              }
            }
            else
            {
              v7 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
              if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
              {
                int v18 = 136315394;
                v19 = "-[IXUninstallOptions isEqual:]";
                __int16 v20 = 2080;
                v21 = "ignoreRemovability";
                goto LABEL_32;
              }
            }
          }
          else
          {
            v7 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
            if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
            {
              int v18 = 136315394;
              v19 = "-[IXUninstallOptions isEqual:]";
              __int16 v20 = 2080;
              v21 = "systemAppNotAllowed";
              goto LABEL_32;
            }
          }
          goto LABEL_33;
        }
        v7 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_33;
        }
      }
      else
      {
        v7 = IXGetLoggingHandle((uint64_t)kIXLoggingSubsystem);
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_33;
        }
      }
      int v18 = 136315394;
      v19 = "-[IXUninstallOptions isEqual:]";
      __int16 v20 = 2080;
      v21 = "waitForDeletion";
      goto LABEL_32;
    }
    BOOL v8 = 0;
  }
LABEL_35:

  return v8;
}

- (id)description
{
  BOOL requestUserConfirmation = self->_requestUserConfirmation;
  BOOL waitForDeletion = self->_waitForDeletion;
  BOOL showArchiveOption = self->_showArchiveOption;
  BOOL showDemotionOption = self->_showDemotionOption;
  BOOL systemAppNotAllowed = self->_systemAppNotAllowed;
  BOOL ignoreRemovability = self->_ignoreRemovability;
  BOOL ignoreRestrictions = self->_ignoreRestrictions;
  if (self->_ignoreAppProtection) {
    uint64_t v9 = 89;
  }
  else {
    uint64_t v9 = 78;
  }
  if (ignoreRestrictions) {
    uint64_t v10 = 89;
  }
  else {
    uint64_t v10 = 78;
  }
  if (ignoreRemovability) {
    uint64_t v11 = 89;
  }
  else {
    uint64_t v11 = 78;
  }
  if (systemAppNotAllowed) {
    uint64_t v12 = 89;
  }
  else {
    uint64_t v12 = 78;
  }
  if (showDemotionOption) {
    uint64_t v13 = 89;
  }
  else {
    uint64_t v13 = 78;
  }
  if (showArchiveOption) {
    uint64_t v14 = 89;
  }
  else {
    uint64_t v14 = 78;
  }
  if (waitForDeletion) {
    uint64_t v15 = 89;
  }
  else {
    uint64_t v15 = 78;
  }
  if (requestUserConfirmation) {
    uint64_t v16 = 89;
  }
  else {
    uint64_t v16 = 78;
  }
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<confirmation:%c wait:%c archive:%c demote:%c notAllowed:%c ignoreRemovability:%c ignoreRestrictions:%c ignoreAppProtection:%c>", v16, v15, v14, v13, v12, v11, v10, v9);
}

- (BOOL)requestUserConfirmation
{
  return self->_requestUserConfirmation;
}

- (void)setRequestUserConfirmation:(BOOL)a3
{
  self->_BOOL requestUserConfirmation = a3;
}

- (BOOL)waitForDeletion
{
  return self->_waitForDeletion;
}

- (void)setWaitForDeletion:(BOOL)a3
{
  self->_BOOL waitForDeletion = a3;
}

- (BOOL)showArchiveOption
{
  return self->_showArchiveOption;
}

- (void)setShowArchiveOption:(BOOL)a3
{
  self->_BOOL showArchiveOption = a3;
}

- (BOOL)showDemotionOption
{
  return self->_showDemotionOption;
}

- (void)setShowDemotionOption:(BOOL)a3
{
  self->_BOOL showDemotionOption = a3;
}

- (BOOL)systemAppNotAllowed
{
  return self->_systemAppNotAllowed;
}

- (void)setSystemAppNotAllowed:(BOOL)a3
{
  self->_BOOL systemAppNotAllowed = a3;
}

- (BOOL)ignoreRemovability
{
  return self->_ignoreRemovability;
}

- (void)setIgnoreRemovability:(BOOL)a3
{
  self->_BOOL ignoreRemovability = a3;
}

- (BOOL)ignoreRestrictions
{
  return self->_ignoreRestrictions;
}

- (void)setIgnoreRestrictions:(BOOL)a3
{
  self->_BOOL ignoreRestrictions = a3;
}

- (BOOL)ignoreAppProtection
{
  return self->_ignoreAppProtection;
}

- (void)setIgnoreAppProtection:(BOOL)a3
{
  self->_ignoreAppProtection = a3;
}

@end