@interface SKGProcessedItem
- (BOOL)didProcessCalendarEvents;
- (BOOL)didProcessEmbeddings;
- (BOOL)didProcessKeyphrases;
- (BOOL)didProcessPeople;
- (BOOL)errorProcessingEmbeddings;
- (BOOL)errorProcessingKeyphrases;
- (BOOL)errorProcessingPeople;
- (BOOL)isCalendar;
- (BOOL)isFileSystemConsistent;
- (BOOL)isMail;
- (BOOL)isMessages;
- (BOOL)isPommesCtl;
- (BOOL)isSafari;
- (NSArray)addresses;
- (NSArray)authors;
- (NSArray)currencies;
- (NSArray)dates;
- (NSArray)detectedCalendarEventTypes;
- (NSArray)emailAddresses;
- (NSArray)flights;
- (NSArray)keyphrases;
- (NSArray)links;
- (NSArray)locations;
- (NSArray)owners;
- (NSArray)participants;
- (NSArray)phoneNumbers;
- (NSArray)recipients;
- (NSArray)trackingNumbers;
- (NSDictionary)interactions;
- (NSString)bundleIdentifier;
- (NSString)filePath;
- (NSString)personaIdentifier;
- (NSString)protectionClass;
- (NSString)referenceIdentifier;
- (NSString)textContentLanguage;
- (SKGEmbedding)embedding;
- (SKGProcessedItem)initWithReferenceIdentifier:(id)a3 personaIdentifier:(id)a4 bundleIdentifier:(id)a5 protectionClass:(id)a6;
- (unint64_t)textContentSize;
- (void)addAddress:(id)a3;
- (void)addAuthors:(id)a3;
- (void)addCurrency:(id)a3;
- (void)addDate:(id)a3;
- (void)addDetectedCalendarEventTypes:(id)a3;
- (void)addEmailAddress:(id)a3;
- (void)addFlight:(id)a3;
- (void)addInteraction:(id)a3 score:(id)a4;
- (void)addKeyphrase:(id)a3;
- (void)addLink:(id)a3;
- (void)addLocation:(id)a3;
- (void)addOwners:(id)a3;
- (void)addParticipants:(id)a3;
- (void)addPhoneNumber:(id)a3;
- (void)addPrimaryEmbedding:(id)a3;
- (void)addRecipients:(id)a3;
- (void)addSecondaryEmbedding:(id)a3;
- (void)addTrackingNumber:(id)a3;
- (void)clearKeyphrases;
- (void)removeEmbedding;
- (void)setChunkLength:(unint64_t)a3;
- (void)setDidProcessCalendarEvents:(BOOL)a3;
- (void)setDidProcessEmbeddings:(BOOL)a3;
- (void)setDidProcessKeyphrases:(BOOL)a3;
- (void)setDidProcessPeople:(BOOL)a3;
- (void)setEmbeddingFormat:(unint64_t)a3;
- (void)setEmbeddingSize:(unint64_t)a3;
- (void)setEmbeddingVersion:(unint64_t)a3;
- (void)setErrorProcessingEmbeddings:(BOOL)a3;
- (void)setErrorProcessingKeyphrases:(BOOL)a3;
- (void)setErrorProcessingPeople:(BOOL)a3;
- (void)setFilePath:(id)a3;
- (void)setFsIndexDataContentVersion:(id)a3;
- (void)setIsFileSystemConsistent:(BOOL)a3;
- (void)setLanguage:(id)a3;
- (void)setTextContent:(id)a3;
@end

@implementation SKGProcessedItem

- (SKGProcessedItem)initWithReferenceIdentifier:(id)a3 personaIdentifier:(id)a4 bundleIdentifier:(id)a5 protectionClass:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v34.receiver = self;
  v34.super_class = (Class)SKGProcessedItem;
  v14 = [(SKGProcessedItem *)&v34 init];
  if (v14)
  {
    uint64_t v15 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", [v10 UTF8String]);
    v16 = (void *)*((void *)v14 + 28);
    *((void *)v14 + 28) = v15;

    uint64_t v17 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", [v11 UTF8String]);
    v18 = (void *)*((void *)v14 + 29);
    *((void *)v14 + 29) = v17;

    id v19 = v12;
    uint64_t v20 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", [v19 UTF8String]);
    v21 = (void *)*((void *)v14 + 30);
    *((void *)v14 + 30) = v20;

    uint64_t v22 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", [v13 UTF8String]);
    v23 = (void *)*((void *)v14 + 31);
    *((void *)v14 + 31) = v22;

    v24 = (void *)*((void *)v14 + 24);
    *((void *)v14 + 24) = 0;

    v25 = (void *)*((void *)v14 + 13);
    *((void *)v14 + 13) = 0;

    v26 = (void *)*((void *)v14 + 14);
    *((void *)v14 + 14) = 0;

    *((void *)v14 + 25) = 0;
    *(_OWORD *)(v14 + 120) = 0u;
    *(_OWORD *)(v14 + 136) = 0u;
    v27 = (void *)*((void *)v14 + 12);
    *((void *)v14 + 12) = 0;

    v28 = (void *)*((void *)v14 + 19);
    *((void *)v14 + 19) = 0;

    v14[208] = sub_10004A954(v19);
    v14[209] = sub_10004A9C4(v19, v29);
    v14[210] = sub_10004A918(v19, v30);
    v14[211] = sub_10004A9AC(v19, v31);
    v14[212] = sub_10004A9D0(v19, v32);
    [v14 setDidProcessPeople:0];
    [v14 setErrorProcessingPeople:0];
    [v14 setDidProcessCalendarEvents:0];
    [v14 setDidProcessKeyphrases:0];
    [v14 setErrorProcessingKeyphrases:0];
    [v14 setDidProcessEmbeddings:0];
    [v14 setErrorProcessingEmbeddings:0];
  }

  return (SKGProcessedItem *)v14;
}

- (void)setLanguage:(id)a3
{
}

- (void)setTextContent:(id)a3
{
  self->_textSize = (unint64_t)[a3 length];
}

- (void)clearKeyphrases
{
  keyphrases = self->_keyphrases;
  self->_keyphrases = 0;
}

- (void)addKeyphrase:(id)a3
{
  id v4 = a3;
  keyphrases = self->_keyphrases;
  id v8 = v4;
  if (!keyphrases)
  {
    v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v7 = self->_keyphrases;
    self->_keyphrases = v6;

    id v4 = v8;
    keyphrases = self->_keyphrases;
  }
  [(NSMutableSet *)keyphrases addObject:v4];
}

- (NSArray)keyphrases
{
  return (NSArray *)[(NSMutableSet *)self->_keyphrases allObjects];
}

- (void)addEmailAddress:(id)a3
{
  id v4 = a3;
  emailAddresses = self->_emailAddresses;
  id v8 = v4;
  if (!emailAddresses)
  {
    v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v7 = self->_emailAddresses;
    self->_emailAddresses = v6;

    id v4 = v8;
    emailAddresses = self->_emailAddresses;
  }
  [(NSMutableSet *)emailAddresses addObject:v4];
}

- (NSArray)emailAddresses
{
  return (NSArray *)[(NSMutableSet *)self->_emailAddresses allObjects];
}

- (void)addPhoneNumber:(id)a3
{
  id v4 = a3;
  phoneNumbers = self->_phoneNumbers;
  id v8 = v4;
  if (!phoneNumbers)
  {
    v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v7 = self->_phoneNumbers;
    self->_phoneNumbers = v6;

    id v4 = v8;
    phoneNumbers = self->_phoneNumbers;
  }
  [(NSMutableSet *)phoneNumbers addObject:v4];
}

- (NSArray)phoneNumbers
{
  return (NSArray *)[(NSMutableSet *)self->_phoneNumbers allObjects];
}

- (void)addAddress:(id)a3
{
  id v4 = a3;
  addresses = self->_addresses;
  id v8 = v4;
  if (!addresses)
  {
    v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v7 = self->_addresses;
    self->_addresses = v6;

    id v4 = v8;
    addresses = self->_addresses;
  }
  [(NSMutableSet *)addresses addObject:v4];
}

- (NSArray)addresses
{
  return (NSArray *)[(NSMutableSet *)self->_addresses allObjects];
}

- (void)addLocation:(id)a3
{
  id v4 = a3;
  locations = self->_locations;
  id v8 = v4;
  if (!locations)
  {
    v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v7 = self->_locations;
    self->_locations = v6;

    id v4 = v8;
    locations = self->_locations;
  }
  [(NSMutableSet *)locations addObject:v4];
}

- (NSArray)locations
{
  return (NSArray *)[(NSMutableSet *)self->_locations allObjects];
}

- (void)addDate:(id)a3
{
  id v4 = a3;
  dates = self->_dates;
  id v8 = v4;
  if (!dates)
  {
    v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v7 = self->_dates;
    self->_dates = v6;

    id v4 = v8;
    dates = self->_dates;
  }
  [(NSMutableSet *)dates addObject:v4];
}

- (NSArray)dates
{
  return (NSArray *)[(NSMutableSet *)self->_dates allObjects];
}

- (void)addFlight:(id)a3
{
  id v4 = a3;
  flights = self->_flights;
  id v8 = v4;
  if (!flights)
  {
    v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v7 = self->_flights;
    self->_flights = v6;

    id v4 = v8;
    flights = self->_flights;
  }
  [(NSMutableSet *)flights addObject:v4];
}

- (NSArray)flights
{
  return (NSArray *)[(NSMutableSet *)self->_flights allObjects];
}

- (void)addLink:(id)a3
{
  id v4 = a3;
  links = self->_links;
  id v8 = v4;
  if (!links)
  {
    v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v7 = self->_links;
    self->_links = v6;

    id v4 = v8;
    links = self->_links;
  }
  [(NSMutableSet *)links addObject:v4];
}

- (NSArray)links
{
  return (NSArray *)[(NSMutableSet *)self->_links allObjects];
}

- (void)addTrackingNumber:(id)a3
{
  id v4 = a3;
  trackingNumbers = self->_trackingNumbers;
  id v8 = v4;
  if (!trackingNumbers)
  {
    v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v7 = self->_trackingNumbers;
    self->_trackingNumbers = v6;

    id v4 = v8;
    trackingNumbers = self->_trackingNumbers;
  }
  [(NSMutableSet *)trackingNumbers addObject:v4];
}

- (NSArray)trackingNumbers
{
  return (NSArray *)[(NSMutableSet *)self->_trackingNumbers allObjects];
}

- (NSArray)currencies
{
  return (NSArray *)[(NSMutableSet *)self->_currencies allObjects];
}

- (void)addCurrency:(id)a3
{
  id v4 = a3;
  currencies = self->_currencies;
  id v8 = v4;
  if (!currencies)
  {
    v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v7 = self->_currencies;
    self->_currencies = v6;

    id v4 = v8;
    currencies = self->_currencies;
  }
  [(NSMutableSet *)currencies addObject:v4];
}

- (void)addSecondaryEmbedding:(id)a3
{
  id v4 = a3;
  secondaryEmbeddings = self->_secondaryEmbeddings;
  id v8 = v4;
  if (!secondaryEmbeddings)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_secondaryEmbeddings;
    self->_secondaryEmbeddings = v6;

    id v4 = v8;
    secondaryEmbeddings = self->_secondaryEmbeddings;
  }
  [(NSMutableArray *)secondaryEmbeddings addObject:v4];
}

- (void)addPrimaryEmbedding:(id)a3
{
  id v4 = a3;
  primaryEmbeddings = self->_primaryEmbeddings;
  id v8 = v4;
  if (!primaryEmbeddings)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_primaryEmbeddings;
    self->_primaryEmbeddings = v6;

    id v4 = v8;
    primaryEmbeddings = self->_primaryEmbeddings;
  }
  [(NSMutableArray *)primaryEmbeddings addObject:v4];
}

- (void)addDetectedCalendarEventTypes:(id)a3
{
  id v4 = a3;
  detectedCalendarEventTypes = self->_detectedCalendarEventTypes;
  id v8 = v4;
  if (!detectedCalendarEventTypes)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_detectedCalendarEventTypes;
    self->_detectedCalendarEventTypes = v6;

    id v4 = v8;
    detectedCalendarEventTypes = self->_detectedCalendarEventTypes;
  }
  [(NSMutableArray *)detectedCalendarEventTypes addObjectsFromArray:v4];
}

- (void)setChunkLength:(unint64_t)a3
{
  self->_firstChunkLength = a3;
}

- (void)setEmbeddingSize:(unint64_t)a3
{
  unint64_t v3 = 3;
  if (a3 == 768) {
    unint64_t v3 = 2;
  }
  if (a3 == 512) {
    unint64_t v3 = 1;
  }
  if (a3 == 256) {
    unint64_t v3 = 0;
  }
  self->_embeddingSize = v3;
}

- (void)setEmbeddingFormat:(unint64_t)a3
{
  unint64_t v3 = 3;
  if (a3 == 1) {
    unint64_t v3 = 1;
  }
  if (a3 == 2) {
    unint64_t v3 = 0;
  }
  self->_embeddingFormat = v3;
}

- (void)setEmbeddingVersion:(unint64_t)a3
{
  self->_embeddingVersion = a3;
}

- (void)setFsIndexDataContentVersion:(id)a3
{
}

- (void)removeEmbedding
{
  primaryEmbeddings = self->_primaryEmbeddings;
  self->_primaryEmbeddings = 0;

  secondaryEmbeddings = self->_secondaryEmbeddings;
  self->_secondaryEmbeddings = 0;

  *(_OWORD *)&self->_embeddingFormat = 0u;
  *(_OWORD *)&self->_firstChunkLength = 0u;
}

- (void)addOwners:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    owners = self->_owners;
    id v8 = v4;
    if (!owners)
    {
      v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      v7 = self->_owners;
      self->_owners = v6;

      owners = self->_owners;
    }
    [(NSMutableSet *)owners addObjectsFromArray:v8];
    id v4 = v8;
  }
}

- (void)addAuthors:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    authors = self->_authors;
    id v8 = v4;
    if (!authors)
    {
      v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      v7 = self->_authors;
      self->_authors = v6;

      authors = self->_authors;
    }
    [(NSMutableSet *)authors addObjectsFromArray:v8];
    id v4 = v8;
  }
}

- (void)addRecipients:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    recipients = self->_recipients;
    id v8 = v4;
    if (!recipients)
    {
      v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      v7 = self->_recipients;
      self->_recipients = v6;

      recipients = self->_recipients;
    }
    [(NSMutableSet *)recipients addObjectsFromArray:v8];
    id v4 = v8;
  }
}

- (void)addParticipants:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    participants = self->_participants;
    id v8 = v4;
    if (!participants)
    {
      v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      v7 = self->_participants;
      self->_participants = v6;

      participants = self->_participants;
    }
    [(NSMutableSet *)participants addObjectsFromArray:v8];
    id v4 = v8;
  }
}

- (void)addInteraction:(id)a3 score:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (v10 && v6)
  {
    interactions = self->_interactions;
    if (!interactions)
    {
      id v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v9 = self->_interactions;
      self->_interactions = v8;

      interactions = self->_interactions;
    }
    [(NSMutableDictionary *)interactions setObject:v6 forKey:v10];
  }
}

- (NSString)textContentLanguage
{
  return self->_language;
}

- (NSArray)detectedCalendarEventTypes
{
  return (NSArray *)self->_detectedCalendarEventTypes;
}

- (NSDictionary)interactions
{
  return (NSDictionary *)self->_interactions;
}

- (NSArray)owners
{
  return (NSArray *)[(NSMutableSet *)self->_owners allObjects];
}

- (NSArray)authors
{
  return (NSArray *)[(NSMutableSet *)self->_authors allObjects];
}

- (NSArray)recipients
{
  return (NSArray *)[(NSMutableSet *)self->_recipients allObjects];
}

- (NSArray)participants
{
  return (NSArray *)[(NSMutableSet *)self->_participants allObjects];
}

- (SKGEmbedding)embedding
{
  if (self->_primaryEmbeddings || self->_secondaryEmbeddings)
  {
    unint64_t v3 = objc_alloc_init(SKGEmbedding);
    [(SKGEmbedding *)v3 setSecondaryEmbeddings:self->_secondaryEmbeddings];
    [(SKGEmbedding *)v3 setPrimaryEmbeddings:self->_primaryEmbeddings];
    [(SKGEmbedding *)v3 setFirstChunkLength:self->_firstChunkLength];
    [(SKGEmbedding *)v3 setSize:self->_embeddingSize];
    [(SKGEmbedding *)v3 setFormat:self->_embeddingFormat];
    [(SKGEmbedding *)v3 setVersion:self->_embeddingVersion];
    [(SKGEmbedding *)v3 setFsIndexDataContentVersion:self->_fsIndexDataContentVersion];
    [(SKGEmbedding *)v3 setIsFileSystemConsistent:self->_isFileSystemConsistent];
  }
  else
  {
    unint64_t v3 = 0;
  }

  return v3;
}

- (NSString)referenceIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 224, 1);
}

- (NSString)personaIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 232, 1);
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 240, 1);
}

- (NSString)protectionClass
{
  return (NSString *)objc_getProperty(self, a2, 248, 1);
}

- (NSString)filePath
{
  return self->_filePath;
}

- (void)setFilePath:(id)a3
{
}

- (unint64_t)textContentSize
{
  return self->_textContentSize;
}

- (BOOL)isMail
{
  return self->_isMail;
}

- (BOOL)isSafari
{
  return self->_isSafari;
}

- (BOOL)isCalendar
{
  return self->_isCalendar;
}

- (BOOL)isMessages
{
  return self->_isMessages;
}

- (BOOL)isPommesCtl
{
  return self->_isPommesCtl;
}

- (BOOL)didProcessPeople
{
  return self->_didProcessPeople;
}

- (void)setDidProcessPeople:(BOOL)a3
{
  self->_didProcessPeople = a3;
}

- (BOOL)errorProcessingPeople
{
  return self->_errorProcessingPeople;
}

- (void)setErrorProcessingPeople:(BOOL)a3
{
  self->_errorProcessingPeople = a3;
}

- (BOOL)didProcessCalendarEvents
{
  return self->_didProcessCalendarEvents;
}

- (void)setDidProcessCalendarEvents:(BOOL)a3
{
  self->_didProcessCalendarEvents = a3;
}

- (BOOL)didProcessKeyphrases
{
  return self->_didProcessKeyphrases;
}

- (void)setDidProcessKeyphrases:(BOOL)a3
{
  self->_didProcessKeyphrases = a3;
}

- (BOOL)errorProcessingKeyphrases
{
  return self->_errorProcessingKeyphrases;
}

- (void)setErrorProcessingKeyphrases:(BOOL)a3
{
  self->_errorProcessingKeyphrases = a3;
}

- (BOOL)didProcessEmbeddings
{
  return self->_didProcessEmbeddings;
}

- (void)setDidProcessEmbeddings:(BOOL)a3
{
  self->_didProcessEmbeddings = a3;
}

- (BOOL)errorProcessingEmbeddings
{
  return self->_errorProcessingEmbeddings;
}

- (void)setErrorProcessingEmbeddings:(BOOL)a3
{
  self->_errorProcessingEmbeddings = a3;
}

- (BOOL)isFileSystemConsistent
{
  return self->_isFileSystemConsistent;
}

- (void)setIsFileSystemConsistent:(BOOL)a3
{
  self->_isFileSystemConsistent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_protectionClass, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_personaIdentifier, 0);
  objc_storeStrong((id *)&self->_referenceIdentifier, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_authors, 0);
  objc_storeStrong((id *)&self->_owners, 0);
  objc_storeStrong((id *)&self->_fsIndexDataContentVersion, 0);
  objc_storeStrong((id *)&self->_secondaryEmbeddings, 0);
  objc_storeStrong((id *)&self->_primaryEmbeddings, 0);
  objc_storeStrong((id *)&self->_detectedCalendarEventTypes, 0);
  objc_storeStrong((id *)&self->_currencies, 0);
  objc_storeStrong((id *)&self->_trackingNumbers, 0);
  objc_storeStrong((id *)&self->_links, 0);
  objc_storeStrong((id *)&self->_flights, 0);
  objc_storeStrong((id *)&self->_dates, 0);
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_addresses, 0);
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_keyphrases, 0);

  objc_storeStrong((id *)&self->_interactions, 0);
}

@end