@interface AXEventHandInfoRepresentation
+ (BOOL)supportsSecureCoding;
- (AXEventHandInfoRepresentation)initWithCoder:(id)a3;
- (BOOL)encodePathsForCompatibility;
- (BOOL)isStylus;
- (CGPoint)handPosition;
- (NSArray)paths;
- (NSArray)pathsIncludingMayBeginEvents;
- (NSString)description;
- (id)accessibilityEventRepresentationTabularDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)length;
- (unsigned)additionalHandEventFlagsForGeneratedEvents;
- (unsigned)currentFingerCount;
- (unsigned)eventType;
- (unsigned)handEventMask;
- (unsigned)handIdentity;
- (unsigned)handIndex;
- (unsigned)initialFingerCount;
- (unsigned)lifetimeFingerCount;
- (unsigned)swipe;
- (unsigned)systemGesturePossible;
- (void)encodeWithCoder:(id)a3;
- (void)setAdditionalHandEventFlagsForGeneratedEvents:(unsigned int)a3;
- (void)setCurrentFingerCount:(unsigned __int16)a3;
- (void)setEncodePathsForCompatibility:(BOOL)a3;
- (void)setEventType:(unsigned int)a3;
- (void)setHandEventMask:(unsigned int)a3;
- (void)setHandIdentity:(unsigned int)a3;
- (void)setHandIndex:(unsigned int)a3;
- (void)setHandPosition:(CGPoint)a3;
- (void)setInitialFingerCount:(unsigned __int16)a3;
- (void)setLifetimeFingerCount:(unsigned __int16)a3;
- (void)setPaths:(id)a3;
- (void)setPathsIncludingMayBeginEvents:(id)a3;
- (void)setSwipe:(unsigned __int8)a3;
- (void)setSystemGesturePossible:(unsigned __int8)a3;
@end

@implementation AXEventHandInfoRepresentation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(AXEventHandInfoRepresentation);
  [(AXEventHandInfoRepresentation *)v4 setEventType:[(AXEventHandInfoRepresentation *)self eventType]];
  [(AXEventHandInfoRepresentation *)v4 setInitialFingerCount:[(AXEventHandInfoRepresentation *)self initialFingerCount]];
  [(AXEventHandInfoRepresentation *)v4 setCurrentFingerCount:[(AXEventHandInfoRepresentation *)self currentFingerCount]];
  [(AXEventHandInfoRepresentation *)v4 setLifetimeFingerCount:[(AXEventHandInfoRepresentation *)self lifetimeFingerCount]];
  [(AXEventHandInfoRepresentation *)v4 setSwipe:[(AXEventHandInfoRepresentation *)self swipe]];
  [(AXEventHandInfoRepresentation *)v4 setSystemGesturePossible:[(AXEventHandInfoRepresentation *)self systemGesturePossible]];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:self->_paths copyItems:1];
  [(AXEventHandInfoRepresentation *)v4 setPaths:v5];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:self->_pathsIncludingMayBeginEvents copyItems:1];
  [(AXEventHandInfoRepresentation *)v4 setPathsIncludingMayBeginEvents:v6];
  [(AXEventHandInfoRepresentation *)v4 setHandIdentity:[(AXEventHandInfoRepresentation *)self handIdentity]];
  [(AXEventHandInfoRepresentation *)self handPosition];
  -[AXEventHandInfoRepresentation setHandPosition:](v4, "setHandPosition:");
  [(AXEventHandInfoRepresentation *)v4 setHandIndex:[(AXEventHandInfoRepresentation *)self handIndex]];
  [(AXEventHandInfoRepresentation *)v4 setHandEventMask:[(AXEventHandInfoRepresentation *)self handEventMask]];

  return v4;
}

- (AXEventHandInfoRepresentation)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)AXEventHandInfoRepresentation;
  v5 = [(AXEventHandInfoRepresentation *)&v18 init];
  if (v5)
  {
    v5->_eventType = [v4 decodeInt32ForKey:@"eventType"];
    v5->_initialFingerCount = [v4 decodeInt32ForKey:@"initialFingerCount"];
    v5->_currentFingerCount = [v4 decodeInt32ForKey:@"currentFingerCount"];
    v5->_lifetimeFingerCount = [v4 decodeInt32ForKey:@"lifetimeFingerCount"];
    v5->_swipe = [v4 decodeInt32ForKey:@"swipe"];
    v5->_systemGesturePossible = [v4 decodeInt32ForKey:@"systemGesturePossible"];
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"paths"];
    paths = v5->_paths;
    v5->_paths = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"pathsIncludingMayBeginEvents"];
    pathsIncludingMayBeginEvents = v5->_pathsIncludingMayBeginEvents;
    v5->_pathsIncludingMayBeginEvents = (NSArray *)v14;

    v5->_handIdentity = [v4 decodeInt32ForKey:@"handIdentity"];
    v5->_handIndex = [v4 decodeInt32ForKey:@"handIndex"];
    v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"handPosition"];
    [v16 getValue:&v5->_handPosition size:16];

    v5->_handEventMask = [v4 decodeInt32ForKey:@"handEventMask"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  [v7 encodeInt32:self->_eventType forKey:@"eventType"];
  [v7 encodeInt32:self->_initialFingerCount forKey:@"initialFingerCount"];
  [v7 encodeInt32:self->_currentFingerCount forKey:@"currentFingerCount"];
  [v7 encodeInt32:self->_lifetimeFingerCount forKey:@"lifetimeFingerCount"];
  [v7 encodeInt32:self->_swipe forKey:@"swipe"];
  [v7 encodeInt32:self->_systemGesturePossible forKey:@"systemGesturePossible"];
  if ([(AXEventHandInfoRepresentation *)self encodePathsForCompatibility])
  {
    id v4 = [(AXEventHandInfoRepresentation *)self paths];
  }
  else
  {
    id v4 = self->_paths;
  }
  v5 = v4;
  [v7 encodeObject:v4 forKey:@"paths"];
  [v7 encodeObject:self->_pathsIncludingMayBeginEvents forKey:@"pathsIncludingMayBeginEvents"];
  [v7 encodeInt32:self->_handIdentity forKey:@"handIdentity"];
  v6 = [MEMORY[0x1E4F29238] valueWithBytes:&self->_handPosition objCType:"{CGPoint=dd}"];
  [v7 encodeObject:v6 forKey:@"handPosition"];

  [v7 encodeInt32:self->_handIndex forKey:@"handIndex"];
  [v7 encodeInt32:self->_handEventMask forKey:@"handEventMask"];
}

- (id)accessibilityEventRepresentationTabularDescription
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = AXDebugDescriptionForAXHandEventType([(AXEventHandInfoRepresentation *)self eventType]);
  v5 = [v3 stringWithFormat:@"  Hand Info\n    Type:                    %@\n    Initial Finger Count:    %i\n    Current Finger Count:    %i\n    Lifetime Finger Count:    %i\n    Swipe:                   %i\n    System Gesture Possible: %i\n", v4, -[AXEventHandInfoRepresentation initialFingerCount](self, "initialFingerCount"), -[AXEventHandInfoRepresentation currentFingerCount](self, "currentFingerCount"), -[AXEventHandInfoRepresentation lifetimeFingerCount](self, "lifetimeFingerCount"), -[AXEventHandInfoRepresentation swipe](self, "swipe"), -[AXEventHandInfoRepresentation systemGesturePossible](self, "systemGesturePossible")];

  v6 = [(AXEventHandInfoRepresentation *)self paths];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    [v5 appendString:@"    Hand Paths:\n"];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v8 = [(AXEventHandInfoRepresentation *)self paths];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [*(id *)(*((void *)&v15 + 1) + 8 * i) accessibilityEventRepresentationTabularDescription];
          [v5 appendFormat:@"%@", v13];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
  }

  return v5;
}

- (BOOL)isStylus
{
  v3 = [(AXEventHandInfoRepresentation *)self paths];
  id v4 = [v3 firstObject];
  if (v4)
  {
    v5 = [(AXEventHandInfoRepresentation *)self paths];
    v6 = [v5 firstObject];
    BOOL v7 = [v6 transducerType] == 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (NSString)description
{
  v14.receiver = self;
  v14.super_class = (Class)AXEventHandInfoRepresentation;
  v3 = [(AXEventHandInfoRepresentation *)&v14 description];
  id v4 = AXDebugDescriptionForAXHandEventType([(AXEventHandInfoRepresentation *)self eventType]);
  unsigned int v5 = [(AXEventHandInfoRepresentation *)self initialFingerCount];
  unsigned int v6 = [(AXEventHandInfoRepresentation *)self currentFingerCount];
  unsigned int v7 = [(AXEventHandInfoRepresentation *)self lifetimeFingerCount];
  unsigned int v8 = [(AXEventHandInfoRepresentation *)self swipe];
  unsigned int v9 = [(AXEventHandInfoRepresentation *)self systemGesturePossible];
  BOOL v10 = [(AXEventHandInfoRepresentation *)self isStylus];
  uint64_t v11 = [(AXEventHandInfoRepresentation *)self paths];
  uint64_t v12 = [v3 stringByAppendingFormat:@" - eventType %@, initialFingerCount %i, currentFingerCount %i, lifetimeFingerCount %i, swipe %i, systemGesturePossible %i, isStylus %i, \n\t\tpaths %@", v4, v5, v6, v7, v8, v9, v10, v11];

  return (NSString *)v12;
}

- (NSArray)pathsIncludingMayBeginEvents
{
  pathsIncludingMayBeginEvents = self->_pathsIncludingMayBeginEvents;
  if (!pathsIncludingMayBeginEvents) {
    pathsIncludingMayBeginEvents = self->_paths;
  }
  return pathsIncludingMayBeginEvents;
}

- (NSArray)paths
{
  if ([(NSArray *)self->_paths count] || ![(NSArray *)self->_pathsIncludingMayBeginEvents count])
  {
    v3 = self->_paths;
  }
  else
  {
    v3 = [(NSArray *)self->_pathsIncludingMayBeginEvents ax_filteredArrayUsingBlock:&__block_literal_global_2];
  }

  return v3;
}

BOOL __38__AXEventHandInfoRepresentation_paths__block_invoke(uint64_t a1, void *a2)
{
  return ([a2 phaseBits] & 0x80) == 0;
}

- (unsigned)eventType
{
  return self->_eventType;
}

- (void)setEventType:(unsigned int)a3
{
  self->_eventType = a3;
}

- (unsigned)initialFingerCount
{
  return self->_initialFingerCount;
}

- (void)setInitialFingerCount:(unsigned __int16)a3
{
  self->_initialFingerCount = a3;
}

- (unsigned)currentFingerCount
{
  return self->_currentFingerCount;
}

- (void)setCurrentFingerCount:(unsigned __int16)a3
{
  self->_currentFingerCount = a3;
}

- (unsigned)lifetimeFingerCount
{
  return self->_lifetimeFingerCount;
}

- (void)setLifetimeFingerCount:(unsigned __int16)a3
{
  self->_lifetimeFingerCount = a3;
}

- (void)setPaths:(id)a3
{
}

- (void)setPathsIncludingMayBeginEvents:(id)a3
{
}

- (unsigned)systemGesturePossible
{
  return self->_systemGesturePossible;
}

- (void)setSystemGesturePossible:(unsigned __int8)a3
{
  self->_systemGesturePossible = a3;
}

- (unsigned)handIdentity
{
  return self->_handIdentity;
}

- (void)setHandIdentity:(unsigned int)a3
{
  self->_handIdentity = a3;
}

- (unsigned)handIndex
{
  return self->_handIndex;
}

- (void)setHandIndex:(unsigned int)a3
{
  self->_handIndex = a3;
}

- (CGPoint)handPosition
{
  double x = self->_handPosition.x;
  double y = self->_handPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setHandPosition:(CGPoint)a3
{
  self->_handPosition = a3;
}

- (unsigned)handEventMask
{
  return self->_handEventMask;
}

- (void)setHandEventMask:(unsigned int)a3
{
  self->_handEventMask = a3;
}

- (unsigned)additionalHandEventFlagsForGeneratedEvents
{
  return self->_additionalHandEventFlagsForGeneratedEvents;
}

- (void)setAdditionalHandEventFlagsForGeneratedEvents:(unsigned int)a3
{
  self->_additionalHandEventFlagsForGeneratedEvents = a3;
}

- (unint64_t)length
{
  return self->_length;
}

- (BOOL)encodePathsForCompatibility
{
  return self->_encodePathsForCompatibility;
}

- (void)setEncodePathsForCompatibility:(BOOL)a3
{
  self->_encodePathsForCompatibilitdouble y = a3;
}

- (unsigned)swipe
{
  return self->_swipe;
}

- (void)setSwipe:(unsigned __int8)a3
{
  self->_swipe = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathsIncludingMayBeginEvents, 0);

  objc_storeStrong((id *)&self->_paths, 0);
}

@end