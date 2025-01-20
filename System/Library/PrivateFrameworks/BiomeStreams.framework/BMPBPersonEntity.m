@interface BMPBPersonEntity
+ (Class)addressesType;
+ (Class)attributesType;
+ (Class)emailAddressesType;
+ (Class)namesType;
+ (Class)phoneNumbersType;
+ (Class)socialMediaHandlesType;
- (BOOL)hasContactId;
- (BOOL)hasCustomId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)addresses;
- (NSMutableArray)attributes;
- (NSMutableArray)emailAddresses;
- (NSMutableArray)names;
- (NSMutableArray)phoneNumbers;
- (NSMutableArray)socialMediaHandles;
- (NSString)contactId;
- (NSString)customId;
- (id)addressesAtIndex:(unint64_t)a3;
- (id)attributesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)emailAddressesAtIndex:(unint64_t)a3;
- (id)namesAtIndex:(unint64_t)a3;
- (id)phoneNumbersAtIndex:(unint64_t)a3;
- (id)socialMediaHandlesAtIndex:(unint64_t)a3;
- (unint64_t)addressesCount;
- (unint64_t)attributesCount;
- (unint64_t)emailAddressesCount;
- (unint64_t)hash;
- (unint64_t)namesCount;
- (unint64_t)phoneNumbersCount;
- (unint64_t)socialMediaHandlesCount;
- (void)addAddresses:(id)a3;
- (void)addAttributes:(id)a3;
- (void)addEmailAddresses:(id)a3;
- (void)addNames:(id)a3;
- (void)addPhoneNumbers:(id)a3;
- (void)addSocialMediaHandles:(id)a3;
- (void)clearAddresses;
- (void)clearAttributes;
- (void)clearEmailAddresses;
- (void)clearNames;
- (void)clearPhoneNumbers;
- (void)clearSocialMediaHandles;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAddresses:(id)a3;
- (void)setAttributes:(id)a3;
- (void)setContactId:(id)a3;
- (void)setCustomId:(id)a3;
- (void)setEmailAddresses:(id)a3;
- (void)setNames:(id)a3;
- (void)setPhoneNumbers:(id)a3;
- (void)setSocialMediaHandles:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BMPBPersonEntity

- (void)clearNames
{
}

- (void)addNames:(id)a3
{
  id v4 = a3;
  names = self->_names;
  id v8 = v4;
  if (!names)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_names;
    self->_names = v6;

    id v4 = v8;
    names = self->_names;
  }
  [(NSMutableArray *)names addObject:v4];
}

- (unint64_t)namesCount
{
  return [(NSMutableArray *)self->_names count];
}

- (id)namesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_names objectAtIndex:a3];
}

+ (Class)namesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasCustomId
{
  return self->_customId != 0;
}

- (BOOL)hasContactId
{
  return self->_contactId != 0;
}

- (void)clearEmailAddresses
{
}

- (void)addEmailAddresses:(id)a3
{
  id v4 = a3;
  emailAddresses = self->_emailAddresses;
  id v8 = v4;
  if (!emailAddresses)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_emailAddresses;
    self->_emailAddresses = v6;

    id v4 = v8;
    emailAddresses = self->_emailAddresses;
  }
  [(NSMutableArray *)emailAddresses addObject:v4];
}

- (unint64_t)emailAddressesCount
{
  return [(NSMutableArray *)self->_emailAddresses count];
}

- (id)emailAddressesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_emailAddresses objectAtIndex:a3];
}

+ (Class)emailAddressesType
{
  return (Class)objc_opt_class();
}

- (void)clearAddresses
{
}

- (void)addAddresses:(id)a3
{
  id v4 = a3;
  addresses = self->_addresses;
  id v8 = v4;
  if (!addresses)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_addresses;
    self->_addresses = v6;

    id v4 = v8;
    addresses = self->_addresses;
  }
  [(NSMutableArray *)addresses addObject:v4];
}

- (unint64_t)addressesCount
{
  return [(NSMutableArray *)self->_addresses count];
}

- (id)addressesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_addresses objectAtIndex:a3];
}

+ (Class)addressesType
{
  return (Class)objc_opt_class();
}

- (void)clearPhoneNumbers
{
}

- (void)addPhoneNumbers:(id)a3
{
  id v4 = a3;
  phoneNumbers = self->_phoneNumbers;
  id v8 = v4;
  if (!phoneNumbers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_phoneNumbers;
    self->_phoneNumbers = v6;

    id v4 = v8;
    phoneNumbers = self->_phoneNumbers;
  }
  [(NSMutableArray *)phoneNumbers addObject:v4];
}

- (unint64_t)phoneNumbersCount
{
  return [(NSMutableArray *)self->_phoneNumbers count];
}

- (id)phoneNumbersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_phoneNumbers objectAtIndex:a3];
}

+ (Class)phoneNumbersType
{
  return (Class)objc_opt_class();
}

- (void)clearSocialMediaHandles
{
}

- (void)addSocialMediaHandles:(id)a3
{
  id v4 = a3;
  socialMediaHandles = self->_socialMediaHandles;
  id v8 = v4;
  if (!socialMediaHandles)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_socialMediaHandles;
    self->_socialMediaHandles = v6;

    id v4 = v8;
    socialMediaHandles = self->_socialMediaHandles;
  }
  [(NSMutableArray *)socialMediaHandles addObject:v4];
}

- (unint64_t)socialMediaHandlesCount
{
  return [(NSMutableArray *)self->_socialMediaHandles count];
}

- (id)socialMediaHandlesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_socialMediaHandles objectAtIndex:a3];
}

+ (Class)socialMediaHandlesType
{
  return (Class)objc_opt_class();
}

- (void)clearAttributes
{
}

- (void)addAttributes:(id)a3
{
  id v4 = a3;
  attributes = self->_attributes;
  id v8 = v4;
  if (!attributes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_attributes;
    self->_attributes = v6;

    id v4 = v8;
    attributes = self->_attributes;
  }
  [(NSMutableArray *)attributes addObject:v4];
}

- (unint64_t)attributesCount
{
  return [(NSMutableArray *)self->_attributes count];
}

- (id)attributesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_attributes objectAtIndex:a3];
}

+ (Class)attributesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BMPBPersonEntity;
  id v4 = [(BMPBPersonEntity *)&v8 description];
  v5 = [(BMPBPersonEntity *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSMutableArray *)self->_names count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_names, "count"));
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v5 = self->_names;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v39 objects:v45 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v40 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v39 + 1) + 8 * i) dictionaryRepresentation];
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v39 objects:v45 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"names"];
  }
  customId = self->_customId;
  if (customId) {
    [v3 setObject:customId forKey:@"customId"];
  }
  contactId = self->_contactId;
  if (contactId) {
    [v3 setObject:contactId forKey:@"contactId"];
  }
  emailAddresses = self->_emailAddresses;
  if (emailAddresses) {
    [v3 setObject:emailAddresses forKey:@"emailAddresses"];
  }
  addresses = self->_addresses;
  if (addresses) {
    [v3 setObject:addresses forKey:@"addresses"];
  }
  phoneNumbers = self->_phoneNumbers;
  if (phoneNumbers) {
    [v3 setObject:phoneNumbers forKey:@"phoneNumbers"];
  }
  if ([(NSMutableArray *)self->_socialMediaHandles count])
  {
    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_socialMediaHandles, "count"));
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    v17 = self->_socialMediaHandles;
    uint64_t v18 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v35 objects:v44 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v36;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v36 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = [*(id *)(*((void *)&v35 + 1) + 8 * j) dictionaryRepresentation];
          [v16 addObject:v22];
        }
        uint64_t v19 = [(NSMutableArray *)v17 countByEnumeratingWithState:&v35 objects:v44 count:16];
      }
      while (v19);
    }

    [v3 setObject:v16 forKey:@"socialMediaHandles"];
  }
  if ([(NSMutableArray *)self->_attributes count])
  {
    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_attributes, "count"));
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v24 = self->_attributes;
    uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v31 objects:v43 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v32;
      do
      {
        for (uint64_t k = 0; k != v26; ++k)
        {
          if (*(void *)v32 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = objc_msgSend(*(id *)(*((void *)&v31 + 1) + 8 * k), "dictionaryRepresentation", (void)v31);
          [v23 addObject:v29];
        }
        uint64_t v26 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v31 objects:v43 count:16];
      }
      while (v26);
    }

    [v3 setObject:v23 forKey:@"attributes"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BMPBPersonEntityReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  v5 = self->_names;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v55 objects:v64 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v56;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v56 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v55 objects:v64 count:16];
    }
    while (v7);
  }

  if (self->_customId) {
    PBDataWriterWriteStringField();
  }
  if (self->_contactId) {
    PBDataWriterWriteStringField();
  }
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  v10 = self->_emailAddresses;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v51 objects:v63 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v52;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v52 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v51 objects:v63 count:16];
    }
    while (v12);
  }

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v15 = self->_addresses;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v47 objects:v62 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v48;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v48 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteStringField();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v47 objects:v62 count:16];
    }
    while (v17);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v20 = self->_phoneNumbers;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v43 objects:v61 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v44;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v44 != v23) {
          objc_enumerationMutation(v20);
        }
        PBDataWriterWriteStringField();
        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v43 objects:v61 count:16];
    }
    while (v22);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v25 = self->_socialMediaHandles;
  uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v39 objects:v60 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v40;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v40 != v28) {
          objc_enumerationMutation(v25);
        }
        PBDataWriterWriteSubmessage();
        ++v29;
      }
      while (v27 != v29);
      uint64_t v27 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v39 objects:v60 count:16];
    }
    while (v27);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v30 = self->_attributes;
  uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v35 objects:v59 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v36;
    do
    {
      uint64_t v34 = 0;
      do
      {
        if (*(void *)v36 != v33) {
          objc_enumerationMutation(v30);
        }
        PBDataWriterWriteSubmessage();
        ++v34;
      }
      while (v32 != v34);
      uint64_t v32 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v35 objects:v59 count:16];
    }
    while (v32);
  }
}

- (void)copyTo:(id)a3
{
  id v28 = a3;
  if ([(BMPBPersonEntity *)self namesCount])
  {
    [v28 clearNames];
    unint64_t v4 = [(BMPBPersonEntity *)self namesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(BMPBPersonEntity *)self namesAtIndex:i];
        [v28 addNames:v7];
      }
    }
  }
  if (self->_customId) {
    objc_msgSend(v28, "setCustomId:");
  }
  if (self->_contactId) {
    objc_msgSend(v28, "setContactId:");
  }
  if ([(BMPBPersonEntity *)self emailAddressesCount])
  {
    [v28 clearEmailAddresses];
    unint64_t v8 = [(BMPBPersonEntity *)self emailAddressesCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(BMPBPersonEntity *)self emailAddressesAtIndex:j];
        [v28 addEmailAddresses:v11];
      }
    }
  }
  if ([(BMPBPersonEntity *)self addressesCount])
  {
    [v28 clearAddresses];
    unint64_t v12 = [(BMPBPersonEntity *)self addressesCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        v15 = [(BMPBPersonEntity *)self addressesAtIndex:k];
        [v28 addAddresses:v15];
      }
    }
  }
  if ([(BMPBPersonEntity *)self phoneNumbersCount])
  {
    [v28 clearPhoneNumbers];
    unint64_t v16 = [(BMPBPersonEntity *)self phoneNumbersCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t m = 0; m != v17; ++m)
      {
        uint64_t v19 = [(BMPBPersonEntity *)self phoneNumbersAtIndex:m];
        [v28 addPhoneNumbers:v19];
      }
    }
  }
  if ([(BMPBPersonEntity *)self socialMediaHandlesCount])
  {
    [v28 clearSocialMediaHandles];
    unint64_t v20 = [(BMPBPersonEntity *)self socialMediaHandlesCount];
    if (v20)
    {
      unint64_t v21 = v20;
      for (uint64_t n = 0; n != v21; ++n)
      {
        uint64_t v23 = [(BMPBPersonEntity *)self socialMediaHandlesAtIndex:n];
        [v28 addSocialMediaHandles:v23];
      }
    }
  }
  if ([(BMPBPersonEntity *)self attributesCount])
  {
    [v28 clearAttributes];
    unint64_t v24 = [(BMPBPersonEntity *)self attributesCount];
    if (v24)
    {
      unint64_t v25 = v24;
      for (iuint64_t i = 0; ii != v25; ++ii)
      {
        uint64_t v27 = [(BMPBPersonEntity *)self attributesAtIndex:ii];
        [v28 addAttributes:v27];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  uint64_t v6 = self->_names;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v67 objects:v76 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v68;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v68 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v67 + 1) + 8 * v10) copyWithZone:a3];
        [v5 addNames:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v67 objects:v76 count:16];
    }
    while (v8);
  }

  uint64_t v12 = [(NSString *)self->_customId copyWithZone:a3];
  unint64_t v13 = (void *)v5[4];
  v5[4] = v12;

  uint64_t v14 = [(NSString *)self->_contactId copyWithZone:a3];
  v15 = (void *)v5[3];
  v5[3] = v14;

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  unint64_t v16 = self->_emailAddresses;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v63 objects:v75 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v64;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v64 != v19) {
          objc_enumerationMutation(v16);
        }
        unint64_t v21 = (void *)[*(id *)(*((void *)&v63 + 1) + 8 * v20) copyWithZone:a3];
        [v5 addEmailAddresses:v21];

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v63 objects:v75 count:16];
    }
    while (v18);
  }

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  uint64_t v22 = self->_addresses;
  uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v59 objects:v74 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v60;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v60 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = (void *)[*(id *)(*((void *)&v59 + 1) + 8 * v26) copyWithZone:a3];
        [v5 addAddresses:v27];

        ++v26;
      }
      while (v24 != v26);
      uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v59 objects:v74 count:16];
    }
    while (v24);
  }

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v28 = self->_phoneNumbers;
  uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v55 objects:v73 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v56;
    do
    {
      uint64_t v32 = 0;
      do
      {
        if (*(void *)v56 != v31) {
          objc_enumerationMutation(v28);
        }
        uint64_t v33 = (void *)[*(id *)(*((void *)&v55 + 1) + 8 * v32) copyWithZone:a3];
        [v5 addPhoneNumbers:v33];

        ++v32;
      }
      while (v30 != v32);
      uint64_t v30 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v55 objects:v73 count:16];
    }
    while (v30);
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  uint64_t v34 = self->_socialMediaHandles;
  uint64_t v35 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v51 objects:v72 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v52;
    do
    {
      uint64_t v38 = 0;
      do
      {
        if (*(void *)v52 != v37) {
          objc_enumerationMutation(v34);
        }
        long long v39 = (void *)[*(id *)(*((void *)&v51 + 1) + 8 * v38) copyWithZone:a3];
        [v5 addSocialMediaHandles:v39];

        ++v38;
      }
      while (v36 != v38);
      uint64_t v36 = [(NSMutableArray *)v34 countByEnumeratingWithState:&v51 objects:v72 count:16];
    }
    while (v36);
  }

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v40 = self->_attributes;
  uint64_t v41 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v47 objects:v71 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v48;
    do
    {
      uint64_t v44 = 0;
      do
      {
        if (*(void *)v48 != v43) {
          objc_enumerationMutation(v40);
        }
        long long v45 = objc_msgSend(*(id *)(*((void *)&v47 + 1) + 8 * v44), "copyWithZone:", a3, (void)v47);
        [v5 addAttributes:v45];

        ++v44;
      }
      while (v42 != v44);
      uint64_t v42 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v47 objects:v71 count:16];
    }
    while (v42);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((names = self->_names, !((unint64_t)names | v4[6]))
     || -[NSMutableArray isEqual:](names, "isEqual:"))
    && ((customId = self->_customId, !((unint64_t)customId | v4[4]))
     || -[NSString isEqual:](customId, "isEqual:"))
    && ((contactId = self->_contactId, !((unint64_t)contactId | v4[3]))
     || -[NSString isEqual:](contactId, "isEqual:"))
    && ((emailAddresses = self->_emailAddresses, !((unint64_t)emailAddresses | v4[5]))
     || -[NSMutableArray isEqual:](emailAddresses, "isEqual:"))
    && ((addresses = self->_addresses, !((unint64_t)addresses | v4[1]))
     || -[NSMutableArray isEqual:](addresses, "isEqual:"))
    && ((phoneNumbers = self->_phoneNumbers, !((unint64_t)phoneNumbers | v4[7]))
     || -[NSMutableArray isEqual:](phoneNumbers, "isEqual:"))
    && ((socialMediaHandles = self->_socialMediaHandles, !((unint64_t)socialMediaHandles | v4[8]))
     || -[NSMutableArray isEqual:](socialMediaHandles, "isEqual:")))
  {
    attributes = self->_attributes;
    if ((unint64_t)attributes | v4[2]) {
      char v13 = -[NSMutableArray isEqual:](attributes, "isEqual:");
    }
    else {
      char v13 = 1;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_names hash];
  NSUInteger v4 = [(NSString *)self->_customId hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_contactId hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSMutableArray *)self->_emailAddresses hash];
  uint64_t v7 = [(NSMutableArray *)self->_addresses hash];
  uint64_t v8 = v7 ^ [(NSMutableArray *)self->_phoneNumbers hash];
  uint64_t v9 = v6 ^ v8 ^ [(NSMutableArray *)self->_socialMediaHandles hash];
  return v9 ^ [(NSMutableArray *)self->_attributes hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  NSUInteger v4 = (id *)a3;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v5 = v4[6];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v55 objects:v64 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v56 != v8) {
          objc_enumerationMutation(v5);
        }
        [(BMPBPersonEntity *)self addNames:*(void *)(*((void *)&v55 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v55 objects:v64 count:16];
    }
    while (v7);
  }

  if (v4[4]) {
    -[BMPBPersonEntity setCustomId:](self, "setCustomId:");
  }
  if (v4[3]) {
    -[BMPBPersonEntity setContactId:](self, "setContactId:");
  }
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v10 = v4[5];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v51 objects:v63 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v52;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v52 != v13) {
          objc_enumerationMutation(v10);
        }
        [(BMPBPersonEntity *)self addEmailAddresses:*(void *)(*((void *)&v51 + 1) + 8 * j)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v51 objects:v63 count:16];
    }
    while (v12);
  }

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v15 = v4[1];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v47 objects:v62 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v48;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v48 != v18) {
          objc_enumerationMutation(v15);
        }
        [(BMPBPersonEntity *)self addAddresses:*(void *)(*((void *)&v47 + 1) + 8 * k)];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v47 objects:v62 count:16];
    }
    while (v17);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v20 = v4[7];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v43 objects:v61 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v44;
    do
    {
      for (uint64_t m = 0; m != v22; ++m)
      {
        if (*(void *)v44 != v23) {
          objc_enumerationMutation(v20);
        }
        [(BMPBPersonEntity *)self addPhoneNumbers:*(void *)(*((void *)&v43 + 1) + 8 * m)];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v43 objects:v61 count:16];
    }
    while (v22);
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v25 = v4[8];
  uint64_t v26 = [v25 countByEnumeratingWithState:&v39 objects:v60 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v40;
    do
    {
      for (uint64_t n = 0; n != v27; ++n)
      {
        if (*(void *)v40 != v28) {
          objc_enumerationMutation(v25);
        }
        [(BMPBPersonEntity *)self addSocialMediaHandles:*(void *)(*((void *)&v39 + 1) + 8 * n)];
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v39 objects:v60 count:16];
    }
    while (v27);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v30 = v4[2];
  uint64_t v31 = [v30 countByEnumeratingWithState:&v35 objects:v59 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v36;
    do
    {
      for (iuint64_t i = 0; ii != v32; ++ii)
      {
        if (*(void *)v36 != v33) {
          objc_enumerationMutation(v30);
        }
        -[BMPBPersonEntity addAttributes:](self, "addAttributes:", *(void *)(*((void *)&v35 + 1) + 8 * ii), (void)v35);
      }
      uint64_t v32 = [v30 countByEnumeratingWithState:&v35 objects:v59 count:16];
    }
    while (v32);
  }
}

- (NSMutableArray)names
{
  return self->_names;
}

- (void)setNames:(id)a3
{
}

- (NSString)customId
{
  return self->_customId;
}

- (void)setCustomId:(id)a3
{
}

- (NSString)contactId
{
  return self->_contactId;
}

- (void)setContactId:(id)a3
{
}

- (NSMutableArray)emailAddresses
{
  return self->_emailAddresses;
}

- (void)setEmailAddresses:(id)a3
{
}

- (NSMutableArray)addresses
{
  return self->_addresses;
}

- (void)setAddresses:(id)a3
{
}

- (NSMutableArray)phoneNumbers
{
  return self->_phoneNumbers;
}

- (void)setPhoneNumbers:(id)a3
{
}

- (NSMutableArray)socialMediaHandles
{
  return self->_socialMediaHandles;
}

- (void)setSocialMediaHandles:(id)a3
{
}

- (NSMutableArray)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_socialMediaHandles, 0);
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
  objc_storeStrong((id *)&self->_names, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_customId, 0);
  objc_storeStrong((id *)&self->_contactId, 0);
  objc_storeStrong((id *)&self->_attributes, 0);

  objc_storeStrong((id *)&self->_addresses, 0);
}

@end