@interface IDSServerBagLoadedContents
- (IDSServerBagLoadedContents)initWithDictionary:(id)a3 rawContents:(id)a4;
- (IDSServerBagRawContents)rawContents;
- (NSDictionary)dictionary;
- (id)debugDescription;
- (id)description;
@end

@implementation IDSServerBagLoadedContents

- (IDSServerBagLoadedContents)initWithDictionary:(id)a3 rawContents:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  v10 = 0;
  if (v7 && v8)
  {
    v14.receiver = self;
    v14.super_class = (Class)IDSServerBagLoadedContents;
    v11 = [(IDSServerBagLoadedContents *)&v14 init];
    p_isa = (id *)&v11->super.isa;
    if (v11)
    {
      objc_storeStrong((id *)&v11->_dictionary, a3);
      objc_storeStrong(p_isa + 2, a4);
    }
    self = p_isa;
    v10 = self;
  }

  return v10;
}

- (NSDictionary)dictionary
{
  return self->_dictionary;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v8 = objc_msgSend_count(self->_dictionary, v5, v6, v7);
  return (id)objc_msgSend_stringWithFormat_(v3, v9, @"<%@:%p; dictionary.count: %llu; rawContents: %@",
               v10,
               v4,
               self,
               v8,
               self->_rawContents);
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  return (id)objc_msgSend_stringWithFormat_(v3, v5, @"<%@:%p; dictionary: %@; rawContents: %@",
               v6,
               v4,
               self,
               self->_dictionary,
               self->_rawContents);
}

- (IDSServerBagRawContents)rawContents
{
  return self->_rawContents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawContents, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end