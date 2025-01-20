@interface ComponentMagsafe
- (BOOL)isPresent;
- (NFAccessoryHardwareManager)hwManager;
- (id)controllerInfo;
- (id)dieId;
- (void)populateAttributes:(id)a3;
- (void)setHwManager:(id)a3;
@end

@implementation ComponentMagsafe

- (BOOL)isPresent
{
  v3 = +[NFAccessoryHardwareManager sharedHardwareManager];
  [(ComponentMagsafe *)self setHwManager:v3];

  v4 = [(ComponentMagsafe *)self hwManager];

  if (!v4)
  {
    v7 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to get NFAccessoryHardwareManager to check for Magsafe presence", buf, 2u);
    }
    goto LABEL_12;
  }
  v5 = [(ComponentMagsafe *)self hwManager];
  id v15 = 0;
  unsigned int v6 = [v5 getHwSupport:1 error:&v15];
  v7 = v15;

  if (v6 != 2 || v7)
  {
    v10 = DiagnosticLogHandleForCategory();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
LABEL_11:

LABEL_12:
      BOOL v9 = 0;
      goto LABEL_13;
    }
    *(_DWORD *)buf = 67109378;
    unsigned int v17 = v6;
    __int16 v18 = 2112;
    v19 = v7;
    v11 = "Failed to find magsafe support. Supported: %d Error: %@";
    v12 = v10;
    uint32_t v13 = 18;
LABEL_15:
    _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, v11, buf, v13);
    goto LABEL_11;
  }
  v8 = [(ComponentMagsafe *)self dieId];

  if (!v8)
  {
    v10 = DiagnosticLogHandleForCategory();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    v11 = "Magsafe is supported but unable to get die ID";
    v12 = v10;
    uint32_t v13 = 2;
    goto LABEL_15;
  }
  v7 = 0;
  BOOL v9 = 1;
LABEL_13:

  return v9;
}

- (void)populateAttributes:(id)a3
{
  id v4 = a3;
  v5 = [(ComponentMagsafe *)self dieId];
  [v4 setObject:v5 forKeyedSubscript:@"dieId"];

  id v6 = [(ComponentMagsafe *)self controllerInfo];
  [v4 setObject:v6 forKeyedSubscript:@"controllerInfo"];
}

- (id)dieId
{
  v2 = [(ComponentMagsafe *)self hwManager];
  id v8 = 0;
  v3 = [v2 getDieId:&v8];
  id v4 = v8;

  if (!v3 || v4)
  {
    id v6 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Unable to get die ID. Error: %@", buf, 0xCu);
    }

    v5 = 0;
  }
  else
  {
    v5 = [v3 base64EncodedStringWithOptions:0];
  }

  return v5;
}

- (id)controllerInfo
{
  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  id v4 = [(ComponentMagsafe *)self hwManager];
  v5 = [v4 getInfo];

  if (v5)
  {
    id v6 = [v5 objectForKeyedSubscript:@"Controller"];
    if (v6)
    {
      v7 = v6;
      id v8 = [v6 objectForKeyedSubscript:@"firmwareVersion"];
      [v3 setObject:v8 forKeyedSubscript:@"firmwareVersion"];

      BOOL v9 = [v7 objectForKeyedSubscript:@"firmwareRevision"];
      [v3 setObject:v9 forKeyedSubscript:@"firmwareRevision"];

      id v10 = [v7 objectForKeyedSubscript:@"ROMVersion"];
      [v3 setObject:v10 forKeyedSubscript:@"romVersion"];
    }
    else
    {
      v11 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Unable to get magsafe controller info", buf, 2u);
      }

      v7 = 0;
    }
  }
  else
  {
    v7 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint32_t v13 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Unable to get magsafe hardware info", v13, 2u);
    }
  }

  return v3;
}

- (NFAccessoryHardwareManager)hwManager
{
  return self->_hwManager;
}

- (void)setHwManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end