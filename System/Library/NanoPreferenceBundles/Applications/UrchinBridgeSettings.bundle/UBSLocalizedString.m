@interface UBSLocalizedString
+ (id)shared;
- (NSBundle)bundle;
- (UBSLocalizedString)init;
- (id)stringForKey:(id)a3;
- (void)setBundle:(id)a3;
@end

@implementation UBSLocalizedString

+ (id)shared
{
  if (qword_11828 != -1) {
    dispatch_once(&qword_11828, &stru_C560);
  }
  v2 = (void *)qword_11820;

  return v2;
}

- (UBSLocalizedString)init
{
  v5.receiver = self;
  v5.super_class = (Class)UBSLocalizedString;
  v2 = [(UBSLocalizedString *)&v5 init];
  if (v2)
  {
    v3 = +[NSBundle bundleForClass:objc_opt_class()];
    [(UBSLocalizedString *)v2 setBundle:v3];
  }
  return v2;
}

- (id)stringForKey:(id)a3
{
  return [(NSBundle *)self->_bundle localizedStringForKey:a3 value:a3 table:0];
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (void)setBundle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end