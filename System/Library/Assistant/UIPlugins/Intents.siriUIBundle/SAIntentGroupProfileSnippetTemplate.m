@interface SAIntentGroupProfileSnippetTemplate
- (Class)templateViewControllerClass;
- (unint64_t)alignmentValue;
- (unint64_t)imageStyleValue;
- (unint64_t)paddingValue;
- (void)fetchUIImageForTraitCollection:(id)a3 completion:(id)a4;
- (void)setAlignmentValue:(unint64_t)a3;
- (void)setImageStyleValue:(unint64_t)a3;
@end

@implementation SAIntentGroupProfileSnippetTemplate

- (Class)templateViewControllerClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)alignmentValue
{
  v2 = [(SAIntentGroupProfileSnippetTemplate *)self alignment];
  unint64_t v3 = +[SiriIntentsTemplateModelEnumMapper templateAlignmentFromString:v2];

  return v3;
}

- (void)setAlignmentValue:(unint64_t)a3
{
  id v4 = +[SiriIntentsTemplateModelEnumMapper stringFromTemplateAlignment:a3];
  [(SAIntentGroupProfileSnippetTemplate *)self setAlignment:v4];
}

- (unint64_t)imageStyleValue
{
  v2 = [(SAIntentGroupProfileSnippetTemplate *)self imageStyle];
  unint64_t v3 = +[SiriIntentsTemplateModelEnumMapper imageStyleFromString:v2];

  return v3;
}

- (void)setImageStyleValue:(unint64_t)a3
{
  id v4 = +[SiriIntentsTemplateModelEnumMapper stringFromImageStyle:a3];
  [(SAIntentGroupProfileSnippetTemplate *)self setImageStyle:v4];
}

- (unint64_t)paddingValue
{
  return 0;
}

- (void)fetchUIImageForTraitCollection:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = [(SAIntentGroupProfileSnippetTemplate *)self imageURI];
    v9 = +[INCache sharedCache];
    v10 = [v9 cacheableObjectForIdentifier:v8];

    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v11 = v10;
      v12 = [v11 _imageData];
      v13 = [v11 _uri];
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_14B4;
      v26[3] = &unk_8300;
      id v14 = v11;
      id v27 = v14;
      id v28 = v8;
      id v15 = v7;
      id v29 = v15;
      v16 = objc_retainBlock(v26);
      if (v12)
      {
        v17 = +[UIImage imageWithData:v12];
        (*((void (**)(id, void *))v15 + 2))(v15, v17);
      }
      else if (v13)
      {
        v18 = +[SiriUIURLSession sharedURLSession];
        [v18 cancelAllTasksForClient:self];

        v19 = +[SiriUIURLSession sharedURLSession];
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_1588;
        v24[3] = &unk_8328;
        v25 = v16;
        id v20 = [v19 imageTaskWithHTTPGetRequest:v13 client:self completionHandler:v24];

        v17 = v25;
      }
      else
      {
        v21 = +[INUIImageServiceConnection sharedConnection];
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_1598;
        v22[3] = &unk_8350;
        v23 = v16;
        [v21 loadUIImageForINImage:v14 traitCollection:v6 reply:v22];

        v17 = v23;
      }
    }
    else
    {
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
  }
}

@end