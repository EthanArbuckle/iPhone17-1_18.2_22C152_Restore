@interface NEPolicy
- (NEPolicy)init;
- (NEPolicy)initWithOrder:(unsigned int)a3 result:(id)a4 conditions:(id)a5;
- (id)description;
- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4;
@end

@implementation NEPolicy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conditions, 0);

  objc_storeStrong((id *)&self->_result, 0);
}

- (id)description
{
  return [(NEPolicy *)self descriptionWithIndent:0 options:0];
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:0];
  [v7 appendPrettyInt:(int)self->_order withName:@"order" andIndent:v5 options:a4];
  [v7 appendPrettyObject:self->_result withName:@"result" andIndent:v5 options:a4];
  [v7 appendPrettyObject:self->_conditions withName:@"conditions" andIndent:v5 options:a4];

  return v7;
}

- (NEPolicy)initWithOrder:(unsigned int)a3 result:(id)a4 conditions:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)NEPolicy;
  v11 = [(NEPolicy *)&v17 init];
  v12 = v11;
  if (v11)
  {
    v11->_order = a3;
    objc_storeStrong((id *)&v11->_result, a4);
    objc_storeStrong((id *)&v12->_conditions, a5);
    v13 = v12;
  }
  else
  {
    v14 = ne_log_obj();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v16 = 0;
      _os_log_error_impl(&dword_19DDAF000, v14, OS_LOG_TYPE_ERROR, "Failed to init NEPolicy", v16, 2u);
    }
  }
  return v12;
}

- (NEPolicy)init
{
  v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_error_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_ERROR, "Calling init on NEPolicy is not valid", v5, 2u);
  }

  return 0;
}

@end