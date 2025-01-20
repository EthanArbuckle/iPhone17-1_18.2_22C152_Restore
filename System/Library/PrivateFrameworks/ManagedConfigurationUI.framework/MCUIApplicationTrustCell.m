@interface MCUIApplicationTrustCell
- (void)setText:(id)a3 color:(id)a4 enabled:(BOOL)a5;
@end

@implementation MCUIApplicationTrustCell

- (void)setText:(id)a3 color:(id)a4 enabled:(BOOL)a5
{
  BOOL v5 = a5;
  id v14 = a4;
  v8 = (void *)MEMORY[0x1E4F42B58];
  id v9 = a3;
  v10 = [v8 cellConfiguration];
  v11 = v10;
  if (v5)
  {
    v12 = [v10 textProperties];
    [v12 setColor:v14];
  }
  v13 = [v11 textProperties];
  [v13 setAlignment:1];

  [v11 setText:v9];
  [(MCUIApplicationTrustCell *)self setContentConfiguration:v11];
  [(MCUIApplicationTrustCell *)self setUserInteractionEnabled:v5];
}

@end