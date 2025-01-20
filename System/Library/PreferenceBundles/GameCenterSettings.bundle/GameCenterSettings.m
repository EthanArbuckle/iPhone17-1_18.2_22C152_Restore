SEL sub_3460(uint64_t a1)
{
  NSString *v1;
  SEL v2;

  v1 = +[NSString stringWithFormat:@"%@:", a1];
  v2 = NSSelectorFromString(v1);

  return v2;
}

SEL sub_34B8(void *a1)
{
  id v1 = a1;
  v2 = [v1 substringToIndex:1];
  v3 = [v2 uppercaseString];

  v4 = [v1 substringFromIndex:1];

  v5 = +[NSString stringWithFormat:@"set%@%@:withSpecifier:", v3, v4];
  SEL v6 = NSSelectorFromString(v5);

  return v6;
}

void sub_355C(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v5 = sub_3460((uint64_t)v3);
  SEL v6 = sub_34B8(v3);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_37D8;
    v15[3] = &unk_4110;
    id v16 = v3;
    v7 = objc_retainBlock(v15);
    v8 = imp_implementationWithBlock(v7);

    v9 = (objc_class *)objc_opt_class();
    class_addMethod(v9, v5, v8, "@@:@");
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_37E4;
    v13[3] = &unk_4138;
    id v14 = v3;
    v10 = objc_retainBlock(v13);
    v11 = imp_implementationWithBlock(v10);

    v12 = (objc_class *)objc_opt_class();
    class_addMethod(v12, v6, v11, "v@:@@");
  }
}

id sub_37D8(uint64_t a1, void *a2)
{
  return [a2 valueForKey:*(void *)(a1 + 32)];
}

id sub_37E4(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 setValue:a3 forKey:*(void *)(a1 + 32)];
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return _class_addMethod(cls, name, imp, types);
}

IMP imp_implementationWithBlock(id block)
{
  return _imp_implementationWithBlock(block);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

id objc_msgSend_settingsButton(void *a1, const char *a2, ...)
{
  return [a1 settingsButton];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return [a1 textLabel];
}

id objc_msgSend_textStyle(void *a1, const char *a2, ...)
{
  return [a1 textStyle];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return [a1 uppercaseString];
}