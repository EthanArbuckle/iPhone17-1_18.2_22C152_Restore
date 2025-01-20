@interface SKNodeCustomClassUnarchiver
- (Class)unarchiver:(id)a3 cannotDecodeObjectOfClassName:(id)a4 originalClasses:(id)a5;
- (SKNodeCustomClassUnarchiver)init;
- (id)_currentAppModuleName;
- (id)_findValidClassName:(id)a3;
- (id)_mangledSwiftClassName:(id)a3 moduleName:(id)a4;
@end

@implementation SKNodeCustomClassUnarchiver

- (SKNodeCustomClassUnarchiver)init
{
  v6.receiver = self;
  v6.super_class = (Class)SKNodeCustomClassUnarchiver;
  v2 = [(SKNodeCustomClassUnarchiver *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    cache = v2->_cache;
    v2->_cache = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (id)_currentAppModuleName
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  uint64_t v3 = [v2 objectForInfoDictionaryKey:@"CFBundleName"];

  v4 = [v3 stringByReplacingOccurrencesOfString:@" " withString:@"_"];

  return v4;
}

- (id)_mangledSwiftClassName:(id)a3 moduleName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [NSString stringWithFormat:@"_TtC%lu%@%lu%@", objc_msgSend(v6, "length"), v6, objc_msgSend(v5, "length"), v5];

  return v7;
}

- (id)_findValidClassName:(id)a3
{
  id v4 = a3;
  id v5 = [v4 componentsSeparatedByString:@"."];
  if ([v5 count] == 1)
  {
    id v6 = [(SKNodeCustomClassUnarchiver *)self _currentAppModuleName];
    if (!v6) {
      goto LABEL_14;
    }
    v7 = [NSString stringWithFormat:@"%@.%@", v6, v4];
    if (NSClassFromString(v7)) {
      goto LABEL_12;
    }
    v8 = [(SKNodeCustomClassUnarchiver *)self _mangledSwiftClassName:v4 moduleName:v6];
    Class v9 = NSClassFromString(v8);
LABEL_9:
    if (!v9)
    {

      v8 = 0;
    }

    v7 = v8;
LABEL_12:

    id v6 = v7;
    goto LABEL_14;
  }
  if ([v5 count] == 2)
  {
    id v6 = [v5 lastObject];
    if (NSClassFromString((NSString *)v6)) {
      goto LABEL_14;
    }
    v10 = NSString;
    v11 = [v5 firstObject];
    v12 = [v11 stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    v13 = [v5 lastObject];
    v7 = [v10 stringWithFormat:@"%@.%@", v12, v13];

    if (NSClassFromString(v7)) {
      goto LABEL_12;
    }
    v14 = [v5 lastObject];
    v15 = [v5 firstObject];
    v8 = [(SKNodeCustomClassUnarchiver *)self _mangledSwiftClassName:v14 moduleName:v15];

    Class v9 = NSClassFromString(v8);
    goto LABEL_9;
  }
  id v6 = 0;
LABEL_14:

  return v6;
}

- (Class)unarchiver:(id)a3 cannotDecodeObjectOfClassName:(id)a4 originalClasses:(id)a5
{
  id v6 = a4;
  v7 = [(NSMutableDictionary *)self->_cache objectForKeyedSubscript:v6];
  v8 = v7;
  if (v7)
  {
    Class v9 = NSClassFromString(v7);
  }
  else
  {
    v10 = [(SKNodeCustomClassUnarchiver *)self _findValidClassName:v6];
    if (v10)
    {
      [(NSMutableDictionary *)self->_cache setObject:v10 forKeyedSubscript:v6];
      Class v9 = NSClassFromString(v10);
    }
    else
    {
      Class v9 = 0;
    }
  }

  return (Class)v9;
}

- (void).cxx_destruct
{
}

@end