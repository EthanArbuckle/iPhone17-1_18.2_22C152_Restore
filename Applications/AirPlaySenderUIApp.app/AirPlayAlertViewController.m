@interface AirPlayAlertViewController
+ (id)alertWithTitle:(id)a3 withMessage:(id)a4 actions:(id)a5 withCompletion:(id)a6;
@end

@implementation AirPlayAlertViewController

+ (id)alertWithTitle:(id)a3 withMessage:(id)a4 actions:(id)a5 withCompletion:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  v11 = +[UIAlertController alertControllerWithTitle:a3 message:a4 preferredStyle:1];
  if (v11)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v21 = v9;
    id obj = v9;
    id v12 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v12)
    {
      id v13 = v12;
      char v14 = 0;
      uint64_t v15 = *(void *)v26;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v26 != v15) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          v23[0] = _NSConcreteStackBlock;
          v23[1] = 3221225472;
          v23[2] = sub_1000066B4;
          v23[3] = &unk_100018770;
          id v18 = v10;
          v23[4] = v17;
          id v24 = v18;
          v19 = +[UIAlertAction actionWithTitle:v17 style:0 handler:v23];
          [v11 addAction:v19];
          if ((v14 & 1) == 0) {
            [v11 setPreferredAction:v19];
          }

          char v14 = 1;
        }
        id v13 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v13);
    }

    id v9 = v21;
  }

  return v11;
}

@end