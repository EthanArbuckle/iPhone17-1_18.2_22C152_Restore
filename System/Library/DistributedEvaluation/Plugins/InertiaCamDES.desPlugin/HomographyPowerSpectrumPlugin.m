@interface HomographyPowerSpectrumPlugin
- (id)evaluateRecipe:(id)a3 recordInfo:(id)a4 recordData:(id)a5 attachments:(id)a6 error:(id *)a7;
@end

@implementation HomographyPowerSpectrumPlugin

- (id)evaluateRecipe:(id)a3 recordInfo:(id)a4 recordData:(id)a5 attachments:(id)a6 error:(id *)a7
{
  id v7 = a5;
  v18[0] = objc_opt_class();
  v18[1] = objc_opt_class();
  v18[2] = objc_opt_class();
  v18[3] = objc_opt_class();
  v18[4] = objc_opt_class();
  v18[5] = objc_opt_class();
  v18[6] = objc_opt_class();
  v18[7] = objc_opt_class();
  v8 = +[NSArray arrayWithObjects:v18 count:8];
  v9 = +[NSSet setWithArray:v8];
  id v15 = 0;
  uint64_t v10 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v9 fromData:v7 error:&v15];

  id v11 = v15;
  if (v10) {
    v12 = (void *)v10;
  }
  else {
    v12 = &__NSDictionary0__struct;
  }
  if (+[NSJSONSerialization isValidJSONObject:v12])
  {
    CFStringRef v16 = @"homography-data";
    v17 = v12;
    v13 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
  }
  else
  {
    v13 = &off_4130;
  }

  return v13;
}

@end