@interface _MLCANEModel
+ (id)objectWithModel:(id)a3 options:(id)a4 qos:(unsigned int)a5 plist:(id)a6;
- (NSDictionary)options;
- (NSDictionary)plist;
- (_ANEInMemoryModel)anefModel;
- (_MLCANEModel)initWithModel:(id)a3 options:(id)a4 qos:(unsigned int)a5 plist:(id)a6;
- (unsigned)qos;
- (void)dealloc;
@end

@implementation _MLCANEModel

+ (id)objectWithModel:(id)a3 options:(id)a4 qos:(unsigned int)a5 plist:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  v13 = (void *)[objc_alloc((Class)a1) initWithModel:v12 options:v11 qos:v6 plist:v10];

  return v13;
}

- (_MLCANEModel)initWithModel:(id)a3 options:(id)a4 qos:(unsigned int)a5 plist:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)_MLCANEModel;
  v14 = [(_MLCANEModel *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_anefModel, a3);
    objc_storeStrong((id *)&v15->_options, a4);
    v15->_qos = a5;
    objc_storeStrong((id *)&v15->_plist, a6);
  }

  return v15;
}

- (void)dealloc
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  anefModel = self->_anefModel;
  uint64_t qos = self->_qos;
  id v12 = 0;
  char v6 = [(_ANEInMemoryModel *)anefModel unloadWithQoS:qos error:&v12];
  id v7 = v12;
  if ((v6 & 1) == 0)
  {
    v8 = +[MLCLog framework];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = NSStringFromSelector(a2);
      id v10 = self->_anefModel;
      *(_DWORD *)buf = 138412802;
      v14 = v9;
      __int16 v15 = 2112;
      v16 = v10;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_error_impl(&dword_1DD0C9000, v8, OS_LOG_TYPE_ERROR, "%@: failed to unload model=%@ : error=%@", buf, 0x20u);
    }
  }

  v11.receiver = self;
  v11.super_class = (Class)_MLCANEModel;
  [(_MLCANEModel *)&v11 dealloc];
}

- (_ANEInMemoryModel)anefModel
{
  return self->_anefModel;
}

- (NSDictionary)options
{
  return self->_options;
}

- (unsigned)qos
{
  return self->_qos;
}

- (NSDictionary)plist
{
  return self->_plist;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plist, 0);
  objc_storeStrong((id *)&self->_options, 0);

  objc_storeStrong((id *)&self->_anefModel, 0);
}

@end