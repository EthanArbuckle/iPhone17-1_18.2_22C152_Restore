@interface SystemReport
- (BOOL)isPresent;
- (DKReporter)component;
- (void)populateAttributes:(id)a3;
- (void)setComponent:(id)a3;
- (void)setupWithContext:(id)a3;
@end

@implementation SystemReport

- (void)setupWithContext:(id)a3
{
  id v4 = a3;
  v5 = [(SystemReport *)self componentIdentity];
  v6 = [v5 type];
  v7 = [@"Component" stringByAppendingString:v6];

  v8 = [(SystemReport *)self componentIdentity];
  v9 = [v8 identifier];

  if (v9)
  {
    v10 = [(SystemReport *)self componentIdentity];
    v11 = [v10 identifier];
    uint64_t v12 = [v7 stringByAppendingString:v11];

    v7 = (void *)v12;
  }
  Class v13 = NSClassFromString((NSString *)v7);
  if (!v13)
  {
    v16 = DiagnosticLogHandleForCategory();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      goto LABEL_10;
    }
    int v18 = 138412290;
    v19 = v7;
    v17 = "Class named [%@] does not exist";
LABEL_12:
    _os_log_fault_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, v17, (uint8_t *)&v18, 0xCu);
    goto LABEL_10;
  }
  if (![(objc_class *)v13 conformsToProtocol:&OBJC_PROTOCOL___DKReporter])
  {
    v16 = DiagnosticLogHandleForCategory();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      goto LABEL_10;
    }
    int v18 = 138412290;
    v19 = v7;
    v17 = "Class named [%@] does not conform to protocol DKReporter";
    goto LABEL_12;
  }
  v14 = objc_opt_new();
  [(SystemReport *)self setComponent:v14];

  v15 = [(SystemReport *)self component];
  [v15 setupWithContext:v4];

  v16 = DiagnosticLogHandleForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412290;
    v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Running [%@]", (uint8_t *)&v18, 0xCu);
  }
LABEL_10:
}

- (BOOL)isPresent
{
  v2 = [(SystemReport *)self component];
  unsigned __int8 v3 = [v2 isPresent];

  return v3;
}

- (void)populateAttributes:(id)a3
{
  id v4 = a3;
  id v5 = [(SystemReport *)self component];
  [v5 populateAttributes:v4];
}

- (DKReporter)component
{
  return self->_component;
}

- (void)setComponent:(id)a3
{
}

- (void).cxx_destruct
{
}

@end