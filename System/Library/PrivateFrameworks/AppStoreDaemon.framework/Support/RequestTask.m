@interface RequestTask
- (id)initForClient:(id)a3 withOptions:(id)a4;
@end

@implementation RequestTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_response, 0);
}

- (id)initForClient:(id)a3 withOptions:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RequestTask;
  v9 = [(Task *)&v12 init];
  p_isa = (id *)&v9->super.super.super.isa;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_client, a3);
    objc_storeStrong(p_isa + 7, a4);
  }

  return p_isa;
}

@end