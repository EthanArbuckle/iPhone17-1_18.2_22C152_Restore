@interface _GEOServerProxy
+ (id)proxyForClass:(Class)a3;
+ (id)proxyForServer:(id)a3 daemon:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToServerProxy:(id)a3;
- (Class)serverClass;
- (GEOServer)server;
- (id)description;
- (unint64_t)hash;
- (void)_setServer:(id)a3;
- (void)startServerWithDaemon:(id)a3;
@end

@implementation _GEOServerProxy

- (GEOServer)server
{
  return self->_server;
}

- (Class)serverClass
{
  return self->_serverClass;
}

+ (id)proxyForClass:(Class)a3
{
  if (a3)
  {
    if ([(objc_class *)a3 isSubclassOfClass:objc_opt_class()])
    {
      v6 = objc_alloc_init((Class)a1);
      if (v6) {
        v6[1] = a3;
      }
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

+ (id)proxyForServer:(id)a3 daemon:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v8 = objc_alloc_init((Class)a1);
    if (v8)
    {
      v8[1] = objc_opt_class();
      [v8 _setServer:v6];
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_setServer:(id)a3
{
}

- (void)startServerWithDaemon:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!self->_server)
  {
    serverClass = self->_serverClass;
    id v5 = a3;
    id v6 = NSStringFromClass(serverClass);
    id v7 = GEOGetLaunchLog();
    os_signpost_id_t v8 = os_signpost_id_generate(v7);

    v9 = GEOGetLaunchLog();
    v10 = v9;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      int v14 = 138543362;
      v15 = v6;
      _os_signpost_emit_with_name_impl(&dword_188D96000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "LaunchServer", "class=%{public}@", (uint8_t *)&v14, 0xCu);
    }

    v11 = (void *)[objc_alloc(self->_serverClass) initWithDaemon:v5];
    [(_GEOServerProxy *)self _setServer:v11];

    v12 = GEOGetLaunchLog();
    v13 = v12;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      int v14 = 138543362;
      v15 = v6;
      _os_signpost_emit_with_name_impl(&dword_188D96000, v13, OS_SIGNPOST_INTERVAL_END, v8, "LaunchServer", "class=%{public}@", (uint8_t *)&v14, 0xCu);
    }
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(_GEOServerProxy *)self isEqualToServerProxy:v4];

  return v5;
}

- (BOOL)isEqualToServerProxy:(id)a3
{
  return self->_serverClass == (Class)*((void *)a3 + 1);
}

- (unint64_t)hash
{
  return [(objc_class *)self->_serverClass hash];
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = NSStringFromClass(self->_serverClass);
  BOOL v5 = [v3 stringWithFormat:@"<%@: %@>", v4, self->_server];

  return v5;
}

- (void).cxx_destruct
{
}

@end