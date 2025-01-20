@interface ASVError
+ (id)errorWithCode:(unsigned int)a3 localizedDescription:(id)a4;
- (id)localizedDescription;
@end

@implementation ASVError

- (id)localizedDescription
{
  v3 = [(ASVError *)self userInfo];
  v4 = v3;
  if (!v3
    || ([v3 objectForKey:NSLocalizedDescriptionKey],
        (v5 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v7.receiver = self;
    v7.super_class = (Class)ASVError;
    v5 = [(ASVError *)&v7 localizedDescription];
  }

  return v5;
}

+ (id)errorWithCode:(unsigned int)a3 localizedDescription:(id)a4
{
  id v5 = a4;
  NSErrorUserInfoKey v9 = NSLocalizedDescriptionKey;
  id v10 = v5;
  v6 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  objc_super v7 = +[ASVError errorWithDomain:@"ASV" code:a3 userInfo:v6];

  return v7;
}

@end