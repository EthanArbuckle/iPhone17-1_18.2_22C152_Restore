@interface ADCloudKitCapabilitiesRecordBuilder
- (id)build;
- (void)reset;
- (void)setValue:(id)a3 forColumnName:(id)a4;
@end

@implementation ADCloudKitCapabilitiesRecordBuilder

- (void).cxx_destruct
{
}

- (id)build
{
  id v2 = [(NSMutableDictionary *)self->_dictionary copy];
  return v2;
}

- (void)setValue:(id)a3 forColumnName:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  dictionary = self->_dictionary;
  if (!dictionary)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v9 = self->_dictionary;
    self->_dictionary = v8;

    dictionary = self->_dictionary;
  }
  [(NSMutableDictionary *)dictionary setObject:v10 forKey:v6];
}

- (void)reset
{
  self->_dictionary = 0;
  _objc_release_x1();
}

@end