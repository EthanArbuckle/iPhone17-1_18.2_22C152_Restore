@interface CSInstantAnswerAction
+ (id)actionWithType:(id)a3 andUrl:(id)a4;
- (CSInstantAnswerAction)initWithAttributes:(id)a3;
- (CSInstantAnswerAction)initWithType:(id)a3 andUrl:(id)a4;
- (NSString)type;
- (NSString)url;
- (id)attributes;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setType:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation CSInstantAnswerAction

+ (id)actionWithType:(id)a3 andUrl:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithType:v7 andUrl:v6];

  return v8;
}

- (CSInstantAnswerAction)initWithType:(id)a3 andUrl:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CSInstantAnswerAction;
  v8 = [(CSInstantAnswerAction *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(CSInstantAnswerAction *)v8 setType:v6];
    [(CSInstantAnswerAction *)v9 setUrl:v7];
  }

  return v9;
}

- (CSInstantAnswerAction)initWithAttributes:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"type"];
  id v6 = [v4 objectForKeyedSubscript:@"url"];

  id v7 = [(CSInstantAnswerAction *)self initWithType:v5 andUrl:v6];
  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(CSInstantAnswerAction *)self type];
  id v6 = [(CSInstantAnswerAction *)self url];
  id v7 = (void *)[v4 initWithType:v5 andUrl:v6];

  return v7;
}

- (id)attributes
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7[0] = @"type";
  v3 = [(CSInstantAnswerAction *)self type];
  v7[1] = @"url";
  v8[0] = v3;
  id v4 = [(CSInstantAnswerAction *)self url];
  v8[1] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:2];

  return v5;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CSInstantAnswerAction *)self type];
  id v6 = [(CSInstantAnswerAction *)self url];
  id v7 = [v3 stringWithFormat:@"<%@:%p %@ %@", v4, self, v5, v6];

  return v7;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (NSString)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);

  objc_storeStrong((id *)&self->_type, 0);
}

@end