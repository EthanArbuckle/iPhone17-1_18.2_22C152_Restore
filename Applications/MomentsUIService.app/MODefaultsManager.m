@interface MODefaultsManager
- (MODefaultsManager)init;
- (MODefaultsManager)initWithSuiteName:(id)a3;
- (MODefaultsManager)initWithUniverse:(id)a3;
- (NSUserDefaults)userDefaults;
- (id)objectForKey:(id)a3;
- (id)objectForKeyWithoutLog:(id)a3;
- (void)deleteObjectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setObjectWithoutLog:(id)a3 forKey:(id)a4;
@end

@implementation MODefaultsManager

- (MODefaultsManager)init
{
  return [(MODefaultsManager *)self initWithUniverse:0];
}

- (MODefaultsManager)initWithUniverse:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MODefaultsManager;
  v3 = [(MODefaultsManager *)&v7 init];
  if (v3)
  {
    uint64_t v4 = +[NSUserDefaults standardUserDefaults];
    userDefaults = v3->_userDefaults;
    v3->_userDefaults = (NSUserDefaults *)v4;
  }
  return v3;
}

- (id)objectForKey:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v6 = [(NSUserDefaults *)self->_userDefaults objectForKey:v5];
    objc_super v7 = _mo_log_facility_get_os_log(&MOLogFacilityDefaults);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      [(MODefaultsManager *)(uint64_t)v5 objectForKey:v7];
    }
  }
  else
  {
    v8 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[MODefaultsManager objectForKey:]();
    }

    v9 = +[NSAssertionHandler currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"MODefaultsManager.m" lineNumber:32 description:@"Invalid parameter not satisfying: key (in %s:%d)", "-[MODefaultsManager objectForKey:]", 32];

    objc_super v7 = _mo_log_facility_get_os_log(&MOLogFacilityDefaults);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[MODefaultsManager objectForKey:](v7);
    }
    v6 = 0;
  }

  return v6;
}

- (id)objectForKeyWithoutLog:(id)a3
{
  if (a3)
  {
    uint64_t v4 = -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:");
  }
  else
  {
    v6 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[MODefaultsManager objectForKeyWithoutLog:]();
    }

    objc_super v7 = +[NSAssertionHandler currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"MODefaultsManager.m" lineNumber:52 description:@"Invalid parameter not satisfying: key (in %s:%d)", "-[MODefaultsManager objectForKeyWithoutLog:]", 52];

    v8 = _mo_log_facility_get_os_log(&MOLogFacilityDefaults);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[MODefaultsManager objectForKeyWithoutLog:](v8);
    }

    uint64_t v4 = 0;
  }

  return v4;
}

- (void)deleteObjectForKey:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v6 = _mo_log_facility_get_os_log(&MOLogFacilityDefaults);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v10 = "-[MODefaultsManager deleteObjectForKey:]";
      __int16 v11 = 2112;
      id v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s, deleting key, %@", buf, 0x16u);
    }

    [(NSUserDefaults *)self->_userDefaults removeObjectForKey:v5];
  }
  else
  {
    objc_super v7 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[MODefaultsManager deleteObjectForKey:]();
    }

    v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"MODefaultsManager.m" lineNumber:66 description:@"Invalid parameter not satisfying: key (in %s:%d)", "-[MODefaultsManager deleteObjectForKey:]", 66];
  }
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    v9 = _mo_log_facility_get_os_log(&MOLogFacilityDefaults);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v13 = "-[MODefaultsManager setObject:forKey:]";
      __int16 v14 = 2112;
      id v15 = v8;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s, key, %@, value, %@", buf, 0x20u);
    }

    [(NSUserDefaults *)self->_userDefaults setObject:v7 forKey:v8];
  }
  else
  {
    v10 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[MODefaultsManager setObject:forKey:]();
    }

    __int16 v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"MODefaultsManager.m" lineNumber:80 description:@"Invalid parameter not satisfying: key (in %s:%d)", "-[MODefaultsManager setObject:forKey:]", 80];
  }
}

- (void)setObjectWithoutLog:(id)a3 forKey:(id)a4
{
  if (a4)
  {
    userDefaults = self->_userDefaults;
    -[NSUserDefaults setObject:forKey:](userDefaults, "setObject:forKey:", a3);
  }
  else
  {
    id v7 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[MODefaultsManager setObjectWithoutLog:forKey:]();
    }

    id v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"MODefaultsManager.m" lineNumber:97 description:@"Invalid parameter not satisfying: key (in %s:%d)", "-[MODefaultsManager setObjectWithoutLog:forKey:]", 97];
  }
}

- (MODefaultsManager)initWithSuiteName:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MODefaultsManager;
  id v5 = [(MODefaultsManager *)&v9 init];
  if (v5)
  {
    v6 = (NSUserDefaults *)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:v4];
    userDefaults = v5->_userDefaults;
    v5->_userDefaults = v6;
  }
  return v5;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void).cxx_destruct
{
}

- (void)objectForKey:(os_log_t)log .cold.1(os_log_t log)
{
  int v1 = 136315138;
  v2 = "-[MODefaultsManager objectForKey:]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s, key cannot be nil!", (uint8_t *)&v1, 0xCu);
}

- (void)objectForKey:.cold.2()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: key (in %s:%d)", v2, v3, v4, v5, v6);
}

- (void)objectForKey:(os_log_t)log .cold.3(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 136315650;
  uint64_t v4 = "-[MODefaultsManager objectForKey:]";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s, key, %@, value, %@", (uint8_t *)&v3, 0x20u);
}

- (void)objectForKeyWithoutLog:(os_log_t)log .cold.1(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[MODefaultsManager objectForKeyWithoutLog:]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s, key cannot be nil!", (uint8_t *)&v1, 0xCu);
}

- (void)objectForKeyWithoutLog:.cold.2()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: key (in %s:%d)", v2, v3, v4, v5, v6);
}

- (void)deleteObjectForKey:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: key (in %s:%d)", v2, v3, v4, v5, v6);
}

- (void)setObject:forKey:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: key (in %s:%d)", v2, v3, v4, v5, v6);
}

- (void)setObjectWithoutLog:forKey:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1_0((void *)&_mh_execute_header, v0, v1, "Invalid parameter not satisfying: key (in %s:%d)", v2, v3, v4, v5, v6);
}

@end