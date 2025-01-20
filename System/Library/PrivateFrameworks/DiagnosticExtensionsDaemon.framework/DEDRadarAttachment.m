@interface DEDRadarAttachment
- (DEDRadarAttachment)initWithDictionary:(id)a3;
- (NSString)fileName;
- (id)description;
- (void)setFileName:(id)a3;
@end

@implementation DEDRadarAttachment

- (DEDRadarAttachment)initWithDictionary:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DEDRadarAttachment;
  v5 = [(DEDRadarAttachment *)&v8 init];
  if (!v5) {
    goto LABEL_4;
  }
  v6 = [v4 objectForKeyedSubscript:@"fileName"];
  if (v6)
  {
    [(DEDRadarAttachment *)v5 setFileName:v6];

LABEL_4:
    v6 = v5;
  }

  return v6;
}

- (id)description
{
  v10[1] = *MEMORY[0x263EF8340];
  v9 = @"fileName";
  v2 = [(DEDRadarAttachment *)self fileName];
  v10[0] = v2;
  v3 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];

  id v4 = NSString;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = [v4 stringWithFormat:@"%@: %@", v6, v3];

  return v7;
}

- (NSString)fileName
{
  return self->_fileName;
}

- (void)setFileName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end