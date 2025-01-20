@interface MCMXPCMessageSetCodeSignMapping
- (MCMXPCMessageSetCodeSignMapping)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5;
- (id)info;
- (id)options;
@end

@implementation MCMXPCMessageSetCodeSignMapping

- (void).cxx_destruct
{
  objc_storeStrong(&self->_options, 0);

  objc_storeStrong(&self->_info, 0);
}

- (id)options
{
  return self->_options;
}

- (id)info
{
  return self->_info;
}

- (MCMXPCMessageSetCodeSignMapping)initWithXPCObject:(id)a3 context:(id)a4 error:(unint64_t *)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v21.receiver = self;
  v21.super_class = (Class)MCMXPCMessageSetCodeSignMapping;
  v9 = [(MCMXPCMessageWithIdentifierBase *)&v21 initWithXPCObject:v8 context:a4 error:a5];
  v10 = v9;
  if (!v9) {
    goto LABEL_12;
  }
  uint64_t v20 = 1;
  uint64_t v11 = [(MCMXPCMessageBase *)v9 nsObjectFromXPCObject:v8 key:"CodeSigningInfo" error:&v20];
  id info = v10->_info;
  v10->_id info = (id)v11;

  unint64_t v13 = v20;
  if (!v10->_info && v20 != 1) {
    goto LABEL_13;
  }
  uint64_t v20 = 1;
  uint64_t v15 = [(MCMXPCMessageBase *)v10 nsObjectFromXPCObject:v8 key:"OptionsDictionary" error:&v20];
  id options = v10->_options;
  v10->_id options = (id)v15;

  unint64_t v13 = v20;
  if (v10->_options || v20 == 1)
  {
LABEL_12:
    v18 = v10;
  }
  else
  {
LABEL_13:
    if (a5) {
      *a5 = v13;
    }
    v18 = 0;
  }

  return v18;
}

@end