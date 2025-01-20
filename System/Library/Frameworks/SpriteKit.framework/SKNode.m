@interface SKNode
+ (BOOL)supportsSecureCoding;
+ (SKNode)node;
+ (SKNode)nodeWithFileNamed:(NSString *)filename;
+ (SKNode)nodeWithFileNamed:(NSString *)filename securelyWithClasses:(NSSet *)classes andError:(NSError *)error;
+ (id)debugHierarchyChildGroupingID;
+ (id)debugHierarchyObjectsInGroupWithID:(id)a3 onObject:(id)a4 outOptions:(id *)a5;
+ (id)debugHierarchyPropertyDescriptions;
+ (id)debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6;
+ (id)nodeFromCaptureData:(id)a3;
- (BOOL)_isEffectivelyHidden;
- (BOOL)_isEligibleForFocus;
- (BOOL)_pathFromPhysicsBodyToPoints:(SKNode *)self outSize:(SEL)a2;
- (BOOL)_showBounds;
- (BOOL)canBecomeFocused;
- (BOOL)containsPoint:(CGPoint)a3 withRadius:(double)a4;
- (BOOL)containsPoint:(CGPoint)p;
- (BOOL)hasActions;
- (BOOL)hasChildren;
- (BOOL)hasUniformAlphaAndIsVisible;
- (BOOL)inParentHierarchy:(SKNode *)parent;
- (BOOL)intersectsNode:(SKNode *)node;
- (BOOL)intersectsNode:(id)a3 useAlphaTest:(BOOL)a4;
- (BOOL)isEqualToNode:(SKNode *)node;
- (BOOL)isHidden;
- (BOOL)isPaused;
- (BOOL)isUserInteractionEnabled;
- (BOOL)needsUpdate;
- (BOOL)performFullCapture;
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (CGFloat)alpha;
- (CGFloat)speed;
- (CGFloat)xScale;
- (CGFloat)yScale;
- (CGFloat)zPosition;
- (CGFloat)zRotation;
- (CGPath)outline;
- (CGPoint)_anchorPoint;
- (CGPoint)convertPoint:(CGPoint)cgpoint fromCoordinateSpace:(id)a4;
- (CGPoint)convertPoint:(CGPoint)cgpoint toCoordinateSpace:(id)a4;
- (CGPoint)convertPoint:(CGPoint)point fromNode:(SKNode *)node;
- (CGPoint)convertPoint:(CGPoint)point toNode:(SKNode *)node;
- (CGPoint)convertPointFromParent:(CGPoint)a3;
- (CGPoint)convertPointToParent:(CGPoint)a3;
- (CGPoint)position;
- (CGRect)_convertFrameToView:(id)a3;
- (CGRect)_untransformedBounds;
- (CGRect)calculateAccumulatedFrame;
- (CGRect)convertRect:(CGRect)a3 fromCoordinateSpace:(id)a4;
- (CGRect)convertRect:(CGRect)a3 toCoordinateSpace:(id)a4;
- (CGRect)frame;
- (CGSize)_size;
- (CGSize)_untransformedSize;
- (CGSize)size;
- (Class)swiftClassFromString:(id)a3 moduleName:(id)a4;
- (GKEntity)entity;
- (NSArray)_allActions;
- (NSArray)children;
- (NSArray)constraints;
- (NSArray)nodesAtPoint:(CGPoint)p;
- (NSArray)objectForKeyedSubscript:(NSString *)name;
- (NSArray)preferredFocusEnvironments;
- (NSDictionary)attributeValues;
- (NSMutableDictionary)_info;
- (NSMutableDictionary)userData;
- (NSString)description;
- (NSString)name;
- (SKAction)actionForKey:(NSString *)key;
- (SKAttributeValue)valueForAttributeNamed:(NSString *)key;
- (SKNode)childNodeWithName:(NSString *)name;
- (SKNode)init;
- (SKNode)initWithCoder:(NSCoder *)aDecoder;
- (SKNode)nodeAtPoint:(CGPoint)p;
- (SKNode)parent;
- (SKNodeFocusBehavior)focusBehavior;
- (SKPhysicsBody)physicsBody;
- (SKReachConstraints)reachConstraints;
- (SKScene)scene;
- (double)globalAccumulatedBoundingVerts;
- (double)globalBoundingVerts;
- (double)xRotation;
- (double)yRotation;
- (id)_copyImageData;
- (id)_descendants;
- (id)_descendantsWithPredicate:(id)a3;
- (id)_subnodeFromIndexPath:(id)a3;
- (id)allIntersectionsWithNode:(id)a3 useAlphaTest:(BOOL)a4;
- (id)archiveToFile:(id)a3;
- (id)childrenInRect:(CGRect)a3;
- (id)containingView;
- (id)copy;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createDebugHierarchyVisualRepresentation;
- (id)createFullCaptureData;
- (id)focusItemsInRect:(CGRect)a3;
- (id)nodeAtPoint:(CGPoint)a3 recursive:(BOOL)a4;
- (id)physicsField;
- (shared_ptr<PKCAether>)_aether;
- (void)_backingNode;
- (void)_debugPrint:(int)a3;
- (void)_debugPrint:(int)a3 mask:(unint64_t)a4;
- (void)_descendantsToMutableArray:(id)a3;
- (void)_descendantsWithPredicate:(id)a3 toMutableArray:(id)a4;
- (void)_enumerateChildNodesWithName:(id)a3 usingBlock:(id)a4 stopPointer:(BOOL *)a5;
- (void)_getBasePhysicsScale:(float *)a3 yScale:(float *)a4;
- (void)_getWorldTransform:(float *)a3 positionY:(float *)a4 rotation:(float *)a5 xScale:(float *)a6 yScale:(float *)a7;
- (void)_makeBackingNode;
- (void)_processSearchTokens:()vector<Token visited:(std:(void *)a4 :(id)a5 allocator<Token>> *)a3 usingBlock:(BOOL *)a6 stopPointer:;
- (void)_removeAction:(id)a3;
- (void)_removeChild:(id)a3;
- (void)_runAction:(id)a3;
- (void)_update:(double)a3;
- (void)addChild:(SKNode *)node;
- (void)addChild:(id)a3 withKey:(id)a4;
- (void)dealloc;
- (void)debugPrint;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateChildNodesWithName:(NSString *)name usingBlock:(void *)block;
- (void)insertChild:(SKNode *)node atIndex:(NSInteger)index;
- (void)moveToParent:(SKNode *)parent;
- (void)removeActionForKey:(NSString *)key;
- (void)removeAllActions;
- (void)removeAllChildren;
- (void)removeChild:(id)a3;
- (void)removeChildAtIndex:(int64_t)a3;
- (void)removeChildrenInArray:(NSArray *)nodes;
- (void)removeFromParent;
- (void)runAction:(SKAction *)action;
- (void)runAction:(SKAction *)action completion:(void *)block;
- (void)runAction:(SKAction *)action withKey:(NSString *)key;
- (void)setAlpha:(CGFloat)alpha;
- (void)setAttributeValues:(NSDictionary *)attributeValues;
- (void)setConstraints:(NSArray *)constraints;
- (void)setEntity:(GKEntity *)entity;
- (void)setFocusBehavior:(SKNodeFocusBehavior)focusBehavior;
- (void)setHidden:(BOOL)hidden;
- (void)setName:(NSString *)name;
- (void)setNeedsFocusUpdate;
- (void)setParent:(id)a3;
- (void)setPaused:(BOOL)paused;
- (void)setPerformFullCapture:(BOOL)a3;
- (void)setPhysicsBody:(SKPhysicsBody *)physicsBody;
- (void)setPosition:(CGPoint)position;
- (void)setReachConstraints:(SKReachConstraints *)reachConstraints;
- (void)setScale:(CGFloat)scale;
- (void)setSpeed:(CGFloat)speed;
- (void)setUserData:(NSMutableDictionary *)userData;
- (void)setUserInteractionEnabled:(BOOL)userInteractionEnabled;
- (void)setValue:(SKAttributeValue *)value forAttributeNamed:(NSString *)key;
- (void)setXRotation:(double)a3;
- (void)setXScale:(CGFloat)xScale;
- (void)setYRotation:(double)a3;
- (void)setYScale:(CGFloat)yScale;
- (void)setZPosition:(CGFloat)zPosition;
- (void)setZRotation:(CGFloat)zRotation;
- (void)set_anchorPoint:(CGPoint)a3;
- (void)set_info:(id)a3;
- (void)updateFocusIfNeeded;
- (void)updatePhysicsPositionAndScaleFromSprite;
@end

@implementation SKNode

- (void)_removeAction:(id)a3
{
  id v4 = a3;
  if (v4) {
    [(NSMutableArray *)self->_actions removeExactObject:v4];
  }
}

- (void)_removeChild:(id)a3
{
  id v4 = a3;
  if (v4) {
    [(NSMutableArray *)self->_children removeExactObject:v4];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (shared_ptr<PKCAether>)_aether
{
  void *v2 = 0;
  v2[1] = 0;
  result.var1 = (__shared_weak_count *)a2;
  result.var0 = (PKCAether *)self;
  return result;
}

- (BOOL)isEqualToNode:(SKNode *)node
{
  id v4 = node;
  if (self == v4)
  {
    LOBYTE(v7) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(SKNode *)self name];
      if (v6)
      {
      }
      else
      {
        v8 = [(SKNode *)v5 name];

        if (!v8)
        {
LABEL_9:
          [(SKNode *)self frame];
          CGFloat v13 = v12;
          CGFloat v15 = v14;
          CGFloat v17 = v16;
          CGFloat v19 = v18;
          [(SKNode *)v5 frame];
          v61.origin.x = v20;
          v61.origin.y = v21;
          v61.size.width = v22;
          v61.size.height = v23;
          v60.origin.x = v13;
          v60.origin.y = v15;
          v60.size.width = v17;
          v60.size.height = v19;
          if (CGRectEqualToRect(v60, v61))
          {
            [(SKNode *)self position];
            double v25 = v24;
            double v27 = v26;
            [(SKNode *)v5 position];
            LOBYTE(v7) = 0;
            if (v25 == v29 && v27 == v28)
            {
              [(SKNode *)self zPosition];
              double v31 = v30;
              v32 = self;
              [v32 zPosition];
              float v33 = v31;
              *(float *)&double v34 = v34;
              if ((COERCE_UNSIGNED_INT(v33 - *(float *)&v34) & 0x60000000) != 0) {
                goto LABEL_21;
              }
              [(SKNode *)self xScale];
              double v36 = v35;
              [(SKNode *)v5 xScale];
              float v37 = v36;
              *(float *)&double v38 = v38;
              if ((COERCE_UNSIGNED_INT(v37 - *(float *)&v38) & 0x60000000) != 0) {
                goto LABEL_21;
              }
              [(SKNode *)self yScale];
              double v40 = v39;
              [(SKNode *)v5 yScale];
              float v41 = v40;
              *(float *)&double v42 = v42;
              if ((COERCE_UNSIGNED_INT(v41 - *(float *)&v42) & 0x60000000) != 0) {
                goto LABEL_21;
              }
              [(SKNode *)self zRotation];
              double v44 = v43;
              [(SKNode *)v5 zRotation];
              float v45 = v44;
              *(float *)&double v46 = v46;
              if ((COERCE_UNSIGNED_INT(v45 - *(float *)&v46) & 0x60000000) != 0) {
                goto LABEL_21;
              }
              [(SKNode *)self alpha];
              double v48 = v47;
              [(SKNode *)v5 alpha];
              float v49 = v48;
              *(float *)&double v50 = v50;
              if ((COERCE_UNSIGNED_INT(v49 - *(float *)&v50) & 0x60000000) != 0) {
                goto LABEL_21;
              }
              BOOL v51 = [(SKNode *)self isHidden];
              if (v51 != [(SKNode *)v5 isHidden]
                || (BOOL v52 = [(SKNode *)self isUserInteractionEnabled],
                    v52 != [(SKNode *)v5 isUserInteractionEnabled])
                || (SKNodeFocusBehavior v53 = [(SKNode *)self focusBehavior],
                    v53 != [(SKNode *)v5 focusBehavior])
                || ([(SKNode *)self speed],
                    double v55 = v54,
                    [(SKNode *)v5 speed],
                    float v56 = v55,
                    *(float *)&double v57 = v57,
                    (COERCE_UNSIGNED_INT(v56 - *(float *)&v57) & 0x60000000) != 0))
              {
LABEL_21:
                LOBYTE(v7) = 0;
              }
              else
              {
                BOOL v59 = [(SKNode *)self isPaused];
                BOOL v7 = v59 ^ [(SKNode *)v5 isPaused] ^ 1;
              }
            }
            goto LABEL_24;
          }
LABEL_23:
          LOBYTE(v7) = 0;
LABEL_24:

          goto LABEL_25;
        }
      }
      v9 = [(SKNode *)self name];
      v10 = [(SKNode *)v5 name];
      char v11 = [v9 isEqualToString:v10];

      if ((v11 & 1) == 0) {
        goto LABEL_23;
      }
      goto LABEL_9;
    }
    LOBYTE(v7) = 0;
  }
LABEL_25:

  return v7;
}

+ (SKNode)node
{
  id v2 = objc_alloc_init((Class)objc_opt_class());

  return (SKNode *)v2;
}

+ (SKNode)nodeWithFileNamed:(NSString *)filename
{
  v24[4] = *MEMORY[0x263EF8340];
  id v4 = filename;
  v5 = SKGetResourceBundle();
  v6 = [v5 pathForResource:v4 ofType:@"sks"];

  if (v6
    || (SKGetResourceBundle(),
        BOOL v7 = objc_claimAutoreleasedReturnValue(),
        [v7 pathForResource:v4 ofType:0],
        v6 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6))
  {
    v8 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v6 options:1 error:0];
    id v23 = 0;
    v9 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v8 error:&v23];
    id v10 = v23;
    [v9 setRequiresSecureCoding:0];
    [v9 setDecodingFailurePolicy:0];
    char v11 = objc_opt_new();
    [v9 setDelegate:v11];
    v24[0] = objc_opt_class();
    v24[1] = objc_opt_class();
    v24[2] = objc_opt_class();
    v24[3] = objc_opt_class();
    double v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:4];
    uint64_t v17 = MEMORY[0x263EF8330];
    uint64_t v18 = 3221225472;
    CGFloat v19 = __28__SKNode_nodeWithFileNamed___block_invoke;
    CGFloat v20 = &unk_263FEA068;
    id v22 = a1;
    id v13 = v9;
    id v21 = v13;
    [v12 enumerateObjectsUsingBlock:&v17];
    double v14 = objc_msgSend(MEMORY[0x263EFFA08], "setWithArray:", v12, v17, v18, v19, v20);
    CGFloat v15 = [v13 decodeObjectOfClasses:v14 forKey:*MEMORY[0x263F081D0]];

    [v13 finishDecoding];
  }
  else
  {
    CGFloat v15 = 0;
  }

  return (SKNode *)v15;
}

void __28__SKNode_nodeWithFileNamed___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  aClass = a2;
  if ([(id)objc_opt_class() isSubclassOfClass:aClass])
  {
    v6 = *(void **)(a1 + 32);
    uint64_t v7 = objc_opt_class();
    v8 = NSStringFromClass(aClass);
    [v6 setClass:v7 forClassName:v8];

    *a4 = 1;
  }
}

+ (SKNode)nodeWithFileNamed:(NSString *)filename securelyWithClasses:(NSSet *)classes andError:(NSError *)error
{
  v25[3] = *MEMORY[0x263EF8340];
  uint64_t v7 = filename;
  v8 = SKGetResourceBundle();
  v9 = [v8 pathForResource:v7 ofType:@"sks"];

  if (v9
    || (SKGetResourceBundle(),
        id v10 = objc_claimAutoreleasedReturnValue(),
        [v10 pathForResource:v7 ofType:0],
        v9 = objc_claimAutoreleasedReturnValue(),
        v10,
        v9))
  {
    char v11 = [MEMORY[0x263EFF8F8] dataWithContentsOfFile:v9 options:1 error:0];
    double v12 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v11 error:error];
    [v12 setDecodingFailurePolicy:1];
    [v12 setRequiresSecureCoding:0];
    id v13 = objc_opt_new();
    [v12 setDelegate:v13];
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    v25[2] = objc_opt_class();
    double v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:3];
    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 3221225472;
    id v21 = __57__SKNode_nodeWithFileNamed_securelyWithClasses_andError___block_invoke;
    id v22 = &unk_263FEA068;
    id v24 = a1;
    id v15 = v12;
    id v23 = v15;
    [v14 enumerateObjectsUsingBlock:&v19];
    double v16 = objc_msgSend(MEMORY[0x263EFFA08], "setWithArray:", v14, v19, v20, v21, v22);
    uint64_t v17 = [v15 decodeTopLevelObjectOfClasses:v16 forKey:*MEMORY[0x263F081D0] error:error];

    [v15 finishDecoding];
  }
  else
  {
    uint64_t v17 = 0;
  }

  return (SKNode *)v17;
}

void __57__SKNode_nodeWithFileNamed_securelyWithClasses_andError___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  aClass = a2;
  if ([(id)objc_opt_class() isSubclassOfClass:aClass])
  {
    v6 = *(void **)(a1 + 32);
    uint64_t v7 = objc_opt_class();
    v8 = NSStringFromClass(aClass);
    [v6 setClass:v7 forClassName:v8];

    *a4 = 1;
  }
}

- (void)_makeBackingNode
{
}

- (void)_backingNode
{
  return self->_skcNode;
}

- (SKNode)init
{
  v9.receiver = self;
  v9.super_class = (Class)SKNode;
  id v2 = [(SKNode *)&v9 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = [(SKNode *)v2 _makeBackingNode];
    v3->_skcNode = (void *)v4;
    *(void *)(v4 + 8) = v3;
    [(SKNode *)v3 _didMakeBackingNode];
    userData = v3->_userData;
    v3->_userData = 0;

    info = v3->_info;
    v3->_info = 0;

    reachConstraints = v3->_reachConstraints;
    v3->_reachConstraints = 0;

    [(SKNode *)v3 setUserInteractionEnabled:0];
    [(SKNode *)v3 setFocusBehavior:0];
    objc_storeWeak((id *)&v3->_parent, 0);
    v3->_version = 51000003;
    [(SKNode *)v3 _initAccessibility];
  }
  return v3;
}

- (Class)swiftClassFromString:(id)a3 moduleName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (v6 && [v6 length])
  {
    id v8 = v7;
  }
  else
  {
    objc_super v9 = [MEMORY[0x263F086E0] mainBundle];
    id v8 = [v9 objectForInfoDictionaryKey:@"CFBundleName"];
  }
  id v10 = [v8 stringByReplacingOccurrencesOfString:@" " withString:@"_"];

  char v11 = [v10 stringByReplacingOccurrencesOfString:@"-" withString:@"_"];

  double v12 = [v11 stringByReplacingOccurrencesOfString:@"." withString:@"_"];

  id v13 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"0123456789"];
  uint64_t v14 = [v12 rangeOfCharacterFromSet:v13];

  if (!v14)
  {
    uint64_t v15 = objc_msgSend(v12, "stringByReplacingCharactersInRange:withString:", 0, 1, @"_");

    double v12 = (void *)v15;
  }
  double v16 = [NSString stringWithFormat:@"_TtC%lu%@%lu%@", objc_msgSend(v12, "length"), v12, objc_msgSend(v5, "length"), v5];
  uint64_t v17 = NSClassFromString(v16);

  return (Class)v17;
}

- (SKNode)initWithCoder:(NSCoder *)aDecoder
{
  v97[9] = *MEMORY[0x263EF8340];
  uint64_t v4 = aDecoder;
  id v74 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  v97[0] = objc_opt_class();
  v97[1] = objc_opt_class();
  v97[2] = objc_opt_class();
  v97[3] = objc_opt_class();
  v97[4] = objc_opt_class();
  v97[5] = objc_opt_class();
  v97[6] = objc_opt_class();
  v97[7] = objc_opt_class();
  v97[8] = objc_opt_class();
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v97 count:9];
  [v74 addObjectsFromArray:v5];

  id v6 = [(NSCoder *)v4 allowedClasses];
  [v74 unionSet:v6];

  uint64_t v7 = [(NSCoder *)v4 decodeObjectOfClasses:v74 forKey:@"_info"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([v7 objectForKeyedSubscript:@"_PB_previewSKNodeCustomClassName"],
        (aClassName = (NSString *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    aClassName = 0;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_11;
  }
  id v8 = NSClassFromString(aClassName);
  if (!v8)
  {
    objc_super v9 = [v7 objectForKeyedSubscript:@"_PB_previewSKNodeCustomModuleName"];
    id v8 = [(SKNode *)self swiftClassFromString:aClassName moduleName:v9];
    if (!v8)
    {
      NSLog(&cfstr_UnableToLoadCu.isa, aClassName, v9);

      goto LABEL_11;
    }
  }
  if (v8 != (objc_class *)objc_opt_class()
    && [(objc_class *)v8 isSubclassOfClass:objc_opt_class()])
  {
    v71 = self;
    id v10 = (SKNode *)[[v8 alloc] initWithCoder:v4];

    goto LABEL_41;
  }
LABEL_11:
  v87.receiver = self;
  v87.super_class = (Class)SKNode;
  char v11 = [(SKNode *)&v87 init];
  id v10 = v11;
  if (v11)
  {
    uint64_t v12 = [(SKNode *)v11 _makeBackingNode];
    v10->_skcNode = (void *)v12;
    *(void *)(v12 + 8) = v10;
    [(SKNode *)v10 _didMakeBackingNode];
    id v13 = (void *)MEMORY[0x263EFFA08];
    v96[0] = objc_opt_class();
    v96[1] = objc_opt_class();
    uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v96 count:2];
    uint64_t v15 = [v13 setWithArray:v14];
    double v16 = [(NSCoder *)v4 decodeObjectOfClasses:v15 forKey:@"_constraints"];
    [(SKNode *)v10 setConstraints:v16];

    uint64_t v17 = (void *)MEMORY[0x263EFFA08];
    v95[0] = objc_opt_class();
    v95[1] = objc_opt_class();
    uint64_t v18 = [MEMORY[0x263EFF8C0] arrayWithObjects:v95 count:2];
    uint64_t v19 = [v17 setWithArray:v18];
    uint64_t v20 = [(NSCoder *)v4 decodeObjectOfClasses:v19 forKey:@"_reachConstraints"];
    [(SKNode *)v10 setReachConstraints:v20];

    id v21 = [(NSCoder *)v4 decodeObjectOfClasses:v74 forKey:@"_userData"];
    [(SKNode *)v10 setUserData:v21];

    [(SKNode *)v10 set_info:v7];
    id v22 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"_name"];
    [(SKNode *)v10 setName:v22];

    id v23 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"_opacity"];
    [v23 doubleValue];
    -[SKNode setAlpha:](v10, "setAlpha:");

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v24 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"_position"];
      [v24 CGPointValue];
      -[SKNode setPosition:](v10, "setPosition:");

      double v25 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"_zRotation"];
      [v25 doubleValue];
      -[SKNode setZRotation:](v10, "setZRotation:");

      double v26 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"_xRotation"];
      [v26 doubleValue];
      -[SKNode setXRotation:](v10, "setXRotation:");

      double v27 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"_yRotation"];
      [v27 doubleValue];
      -[SKNode setYRotation:](v10, "setYRotation:");

      double v28 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"_xScale"];
      [v28 doubleValue];
      -[SKNode setXScale:](v10, "setXScale:");

      double v29 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"_yScale"];
      [v29 doubleValue];
      -[SKNode setYScale:](v10, "setYScale:");

      double v30 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"_zPosition"];
      [v30 doubleValue];
      -[SKNode setZPosition:](v10, "setZPosition:");
    }
    double v31 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"_anchorPoint"];
    [v31 CGPointValue];
    -[SKNode set_anchorPoint:](v10, "set_anchorPoint:");

    v32 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"_hidden"];
    -[SKNode setHidden:](v10, "setHidden:", [v32 BOOLValue]);

    skcNode = v10->_skcNode;
    double v34 = [(NSCoder *)v4 decodeObjectOfClass:objc_opt_class() forKey:@"_skcPaused"];
    (*(void (**)(void *, uint64_t))(*(void *)skcNode + 160))(skcNode, [v34 BOOLValue]);

    double v35 = [(NSCoder *)v4 decodeObjectOfClasses:v74 forKey:@"_PKPhysicsBody"];
    [(SKNode *)v10 setPhysicsBody:v35];

    double v36 = (void *)MEMORY[0x263EFFA08];
    v94[0] = objc_opt_class();
    v94[1] = objc_opt_class();
    v94[2] = objc_opt_class();
    float v37 = [MEMORY[0x263EFF8C0] arrayWithObjects:v94 count:3];
    double v38 = [v36 setWithArray:v37];
    double v39 = [(NSCoder *)v4 decodeObjectOfClasses:v38 forKey:@"_attributeValues"];
    [(SKNode *)v10 setAttributeValues:v39];

    double v40 = (void *)MEMORY[0x263EFFA08];
    v93[0] = objc_opt_class();
    v93[1] = objc_opt_class();
    float v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:v93 count:2];
    double v42 = [v40 setWithArray:v41];
    v72 = [(NSCoder *)v4 decodeObjectOfClasses:v42 forKey:@"_children"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v85 = 0u;
      long long v86 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      id v43 = v72;
      uint64_t v44 = [v43 countByEnumeratingWithState:&v83 objects:v92 count:16];
      if (v44)
      {
        uint64_t v45 = *(void *)v84;
        do
        {
          for (uint64_t i = 0; i != v44; ++i)
          {
            if (*(void *)v84 != v45) {
              objc_enumerationMutation(v43);
            }
            uint64_t v47 = *(void *)(*((void *)&v83 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [(SKNode *)v10 addChild:v47];
            }
          }
          uint64_t v44 = [v43 countByEnumeratingWithState:&v83 objects:v92 count:16];
        }
        while (v44);
      }

      double v48 = (void *)MEMORY[0x263EFFA08];
      v91[0] = objc_opt_class();
      v91[1] = objc_opt_class();
      v91[2] = objc_opt_class();
      float v49 = [MEMORY[0x263EFF8C0] arrayWithObjects:v91 count:3];
      double v50 = [v48 setWithArray:v49];
      BOOL v51 = [(NSCoder *)v4 decodeObjectOfClasses:v50 forKey:@"_keyedSubSprites"];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v52 = objc_opt_new();
        keyedSubSprites = v10->_keyedSubSprites;
        v10->_keyedSubSprites = (NSMutableDictionary *)v52;

        v81[0] = MEMORY[0x263EF8330];
        v81[1] = 3221225472;
        v81[2] = __24__SKNode_initWithCoder___block_invoke;
        v81[3] = &unk_263FEA090;
        v82 = v10;
        [v51 enumerateKeysAndObjectsUsingBlock:v81];
      }
    }
    double v54 = (void *)MEMORY[0x263EFFA08];
    v90[0] = objc_opt_class();
    v90[1] = objc_opt_class();
    v90[2] = objc_opt_class();
    double v55 = [MEMORY[0x263EFF8C0] arrayWithObjects:v90 count:3];
    float v56 = [v54 setWithArray:v55];
    double v57 = [(NSCoder *)v4 decodeObjectOfClasses:v56 forKey:@"_keyedActions"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v58 = objc_opt_new();
      keyedActions = v10->_keyedActions;
      v10->_keyedActions = (NSMutableDictionary *)v58;

      v79[0] = MEMORY[0x263EF8330];
      v79[1] = 3221225472;
      v79[2] = __24__SKNode_initWithCoder___block_invoke_2;
      v79[3] = &unk_263FEA0B8;
      v80 = v10;
      [v57 enumerateKeysAndObjectsUsingBlock:v79];
    }
    CGRect v60 = (void *)MEMORY[0x263EFFA08];
    v89[0] = objc_opt_class();
    v89[1] = objc_opt_class();
    CGRect v61 = [MEMORY[0x263EFF8C0] arrayWithObjects:v89 count:2];
    v62 = [v60 setWithArray:v61];
    v63 = [(NSCoder *)v4 decodeObjectOfClasses:v62 forKey:@"_actions"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v77 = 0u;
      long long v78 = 0u;
      long long v75 = 0u;
      long long v76 = 0u;
      id v64 = v63;
      uint64_t v65 = [v64 countByEnumeratingWithState:&v75 objects:v88 count:16];
      if (v65)
      {
        uint64_t v66 = *(void *)v76;
        do
        {
          for (uint64_t j = 0; j != v65; ++j)
          {
            if (*(void *)v76 != v66) {
              objc_enumerationMutation(v64);
            }
            uint64_t v68 = *(void *)(*((void *)&v75 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [(SKNode *)v10 _runAction:v68];
            }
          }
          uint64_t v65 = [v64 countByEnumeratingWithState:&v75 objects:v88 count:16];
        }
        while (v65);
      }
    }
    [(SKNode *)v10 _initAccessibility];
  }
LABEL_41:
  v69 = v10;

  return v69;
}

void __24__SKNode_initWithCoder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [*(id *)(*(void *)(a1 + 32) + 64) setObject:v5 forKey:v6];
    }
  }
}

void __24__SKNode_initWithCoder___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [*(id *)(*(void *)(a1 + 32) + 56) setObject:v5 forKey:v6];
    }
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v36 = a3;
  uint64_t v4 = [NSNumber numberWithUnsignedInt:self->_version];
  [v36 encodeObject:v4 forKey:@"_version"];

  id v5 = (void *)MEMORY[0x263F08D40];
  [(SKNode *)self position];
  id v6 = objc_msgSend(v5, "valueWithCGPoint:");
  [v36 encodeObject:v6 forKey:@"_position"];

  uint64_t v7 = NSNumber;
  [(SKNode *)self alpha];
  id v8 = objc_msgSend(v7, "numberWithDouble:");
  [v36 encodeObject:v8 forKey:@"_opacity"];

  objc_super v9 = NSNumber;
  [(SKNode *)self xRotation];
  id v10 = objc_msgSend(v9, "numberWithDouble:");
  [v36 encodeObject:v10 forKey:@"_xRotation"];

  char v11 = NSNumber;
  [(SKNode *)self yRotation];
  uint64_t v12 = objc_msgSend(v11, "numberWithDouble:");
  [v36 encodeObject:v12 forKey:@"_yRotation"];

  id v13 = NSNumber;
  [(SKNode *)self zRotation];
  uint64_t v14 = objc_msgSend(v13, "numberWithDouble:");
  [v36 encodeObject:v14 forKey:@"_zRotation"];

  uint64_t v15 = NSNumber;
  [(SKNode *)self xScale];
  double v16 = objc_msgSend(v15, "numberWithDouble:");
  [v36 encodeObject:v16 forKey:@"_xScale"];

  uint64_t v17 = NSNumber;
  [(SKNode *)self yScale];
  uint64_t v18 = objc_msgSend(v17, "numberWithDouble:");
  [v36 encodeObject:v18 forKey:@"_yScale"];

  uint64_t v19 = [(SKNode *)self name];
  [v36 encodeObject:v19 forKey:@"_name"];

  uint64_t v20 = [(SKNode *)self userData];
  [v36 encodeObject:v20 forKey:@"_userData"];

  id v21 = [(SKNode *)self _info];
  [v36 encodeObject:v21 forKey:@"_info"];

  id v22 = [(SKNode *)self constraints];
  id v23 = (void *)[v22 mutableCopy];
  [v36 encodeObject:v23 forKey:@"_constraints"];

  id v24 = [(SKNode *)self reachConstraints];
  [v36 encodeObject:v24 forKey:@"_reachConstraints"];

  double v25 = [(SKNode *)self children];
  double v26 = (void *)[v25 mutableCopy];
  [v36 encodeObject:v26 forKey:@"_children"];

  double v27 = objc_msgSend(NSNumber, "numberWithBool:", -[SKNode isHidden](self, "isHidden"));
  [v36 encodeObject:v27 forKey:@"_hidden"];

  double v28 = objc_msgSend(NSNumber, "numberWithBool:", -[SKNode isPaused](self, "isPaused"));
  [v36 encodeObject:v28 forKey:@"_paused"];

  double v29 = [NSNumber numberWithBool:*((unsigned __int8 *)self->_skcNode + 172)];
  [v36 encodeObject:v29 forKey:@"_skcPaused"];

  double v30 = NSNumber;
  [(SKNode *)self zPosition];
  double v31 = objc_msgSend(v30, "numberWithDouble:");
  [v36 encodeObject:v31 forKey:@"_zPosition"];

  [v36 encodeObject:self->_actions forKey:@"_actions"];
  [v36 encodeObject:self->_keyedActions forKey:@"_keyedActions"];
  [v36 encodeObject:self->_keyedSubSprites forKey:@"_keyedSubSprites"];
  v32 = [(SKNode *)self physicsBody];
  [v36 encodeObject:v32 forKey:@"_PKPhysicsBody"];

  float v33 = [(SKNode *)self attributeValues];
  [v36 encodeObject:v33 forKey:@"_attributeValues"];

  double v34 = (objc_class *)objc_opt_class();
  double v35 = NSStringFromClass(v34);
  [v36 encodeObject:v35 forKey:@"_originalClass"];
}

- (id)copy
{
  uint64_t v3 = MEMORY[0x21052E6F0](self, a2);

  return [(SKNode *)self copyWithZone:v3];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  uint64_t v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  if ([(NSMutableArray *)self->_children count]
    && [(NSMutableDictionary *)self->_keyedSubSprites count])
  {
    id v5 = (void *)[(NSMutableDictionary *)self->_keyedSubSprites copy];
    id v6 = (void *)[(NSMutableArray *)self->_children copy];
    uint64_t v7 = [v5 allValues];
    [v6 removeObjectsInArray:v7];

    id v8 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:v5 copyItems:1];
    objc_super v9 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithArray:v6 copyItems:1];

    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    id v10 = [v8 allKeys];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v67 objects:v74 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v68;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v68 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = *(void *)(*((void *)&v67 + 1) + 8 * i);
          uint64_t v15 = [v8 objectForKey:v14];
          [v4 addChild:v15 withKey:v14];
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v67 objects:v74 count:16];
      }
      while (v11);
    }

    long long v65 = 0u;
    long long v66 = 0u;
    long long v63 = 0u;
    long long v64 = 0u;
    id v16 = v9;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v63 objects:v73 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v64;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v64 != v18) {
            objc_enumerationMutation(v16);
          }
          [v4 addChild:*(void *)(*((void *)&v63 + 1) + 8 * j)];
        }
        uint64_t v17 = [v16 countByEnumeratingWithState:&v63 objects:v73 count:16];
      }
      while (v17);
    }
  }
  else
  {
    uint64_t v20 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithArray:self->_children copyItems:1];
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v16 = v20;
    uint64_t v21 = [v16 countByEnumeratingWithState:&v59 objects:v72 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v60;
      do
      {
        for (uint64_t k = 0; k != v21; ++k)
        {
          if (*(void *)v60 != v22) {
            objc_enumerationMutation(v16);
          }
          [v4 addChild:*(void *)(*((void *)&v59 + 1) + 8 * k)];
        }
        uint64_t v21 = [v16 countByEnumeratingWithState:&v59 objects:v72 count:16];
      }
      while (v21);
    }
    id v8 = v16;
  }

  if ([(NSMutableArray *)self->_actions count] || [(NSMutableDictionary *)self->_keyedActions count])
  {
    id v24 = (void *)[(NSMutableDictionary *)self->_keyedActions copy];
    double v25 = (void *)[(NSMutableArray *)self->_actions mutableCopy];
    double v26 = [v24 allValues];
    [v25 removeObjectsInArray:v26];

    id v27 = (id)[objc_alloc(NSDictionary) initWithDictionary:v24 copyItems:1];
    obuint64_t j = (id)[objc_alloc(MEMORY[0x263EFF980]) initWithArray:v25 copyItems:1];

    double v28 = [v27 allValues];
    [obj addObjectsFromArray:v28];

    objc_storeStrong(v4 + 6, obj);
    uint64_t v29 = [v27 mutableCopy];
    id v30 = v4[7];
    v4[7] = (id)v29;

    uint64_t v31 = [v4 _backingNode];
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v32 = v4[6];
    uint64_t v33 = [v32 countByEnumeratingWithState:&v55 objects:v71 count:16];
    if (v33)
    {
      uint64_t v34 = *(void *)v56;
      do
      {
        for (uint64_t m = 0; m != v33; ++m)
        {
          if (*(void *)v56 != v34) {
            objc_enumerationMutation(v32);
          }
          id v36 = (SKCAction *)[*(id *)(*((void *)&v55 + 1) + 8 * m) caction];
          float v37 = operator new(0x18uLL);
          v37[2] = v36;
          uint64_t v38 = *(void *)(v31 + 176);
          *float v37 = v38;
          v37[1] = v31 + 176;
          *(void *)(v38 + 8) = v37;
          *(void *)(v31 + 176) = v37;
          ++*(void *)(v31 + 192);
          (*((void (**)(SKCAction *, float))v36->var0 + 5))(v36, *(float *)(v31 + 168));
          double v39 = skCurrentTime();
          SKCAction::wasAddedToTargetAtTime(v36, (SKCNode *)v31, v39);
        }
        uint64_t v33 = [v32 countByEnumeratingWithState:&v55 objects:v71 count:16];
      }
      while (v33);
    }
  }
  else
  {
    uint64_t v53 = [objc_alloc(MEMORY[0x263EFF980]) initWithArray:self->_actions copyItems:1];
    id v27 = v4[6];
    v4[6] = (id)v53;
  }

  [(SKNode *)self xScale];
  objc_msgSend(v4, "setXScale:");
  [(SKNode *)self yScale];
  objc_msgSend(v4, "setYScale:");
  [(SKNode *)self position];
  objc_msgSend(v4, "setPosition:");
  [(SKNode *)self zRotation];
  objc_msgSend(v4, "setZRotation:");
  [(SKNode *)self zPosition];
  objc_msgSend(v4, "setZPosition:");
  [(SKNode *)self speed];
  objc_msgSend(v4, "setSpeed:");
  objc_msgSend(v4, "setPaused:", -[SKNode isPaused](self, "isPaused"));
  objc_msgSend(v4, "setHidden:", -[SKNode isHidden](self, "isHidden"));
  objc_msgSend(v4, "setUserInteractionEnabled:", -[SKNode isUserInteractionEnabled](self, "isUserInteractionEnabled"));
  objc_msgSend(v4, "setFocusBehavior:", -[SKNode focusBehavior](self, "focusBehavior"));
  [(SKNode *)self alpha];
  objc_msgSend(v4, "setAlpha:");
  double v40 = [(SKNode *)self physicsBody];
  float v41 = (void *)[v40 copy];
  [v4 setPhysicsBody:v41];

  double v42 = [(SKNode *)self name];
  [v4 setName:v42];

  id v43 = [(SKNode *)self userData];
  uint64_t v44 = (void *)[v43 mutableCopy];
  [v4 setUserData:v44];

  uint64_t v45 = [(SKNode *)self _info];
  double v46 = (void *)[v45 mutableCopy];
  objc_msgSend(v4, "set_info:", v46);

  uint64_t v47 = [(SKNode *)self reachConstraints];
  double v48 = (void *)[v47 copy];
  [v4 setReachConstraints:v48];

  float v49 = [(SKNode *)self constraints];
  double v50 = (void *)[v49 copy];
  [v4 setConstraints:v50];

  [(SKNode *)self _anchorPoint];
  objc_msgSend(v4, "set_anchorPoint:");
  BOOL v51 = [(SKNode *)self attributeValues];
  [v4 setAttributeValues:v51];

  return v4;
}

- (void)removeFromParent
{
  p_parent = &self->_parent;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);

  if (WeakRetained)
  {
    id v9 = objc_loadWeakRetained((id *)p_parent);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    id v6 = objc_loadWeakRetained((id *)p_parent);
    id v10 = v6;
    if (isKindOfClass)
    {
      [v6 removeChild:self];
    }
    else
    {
      objc_opt_class();
      char v7 = objc_opt_isKindOfClass();

      if (v7)
      {
        id v10 = objc_loadWeakRetained((id *)p_parent);
        [v10 removeChild:self];
      }
      else
      {
        id v8 = (void *)MEMORY[0x263EFF940];
        id v10 = objc_loadWeakRetained((id *)p_parent);
        [v8 raise:@"Attemped to remove node from invalid parent", @"Attemped to remove node %@ from invalid parent %@", self, v10 format];
      }
    }
  }
}

- (void)moveToParent:(SKNode *)parent
{
  id v9 = parent;
  id WeakRetained = (SKNode *)objc_loadWeakRetained((id *)&self->_parent);

  if (WeakRetained != v9)
  {
    -[SKNode convertPoint:toNode:](self, "convertPoint:toNode:", v9, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
    double v6 = v5;
    double v8 = v7;
    [(SKNode *)self removeFromParent];
    -[SKNode setPosition:](self, "setPosition:", v6, v8);
    [(SKNode *)v9 addChild:self];
  }
}

- (void)_update:(double)a3
{
}

- (SKScene)scene
{
  uint64_t v6 = 0;
  double v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__2;
  id v10 = __Block_byref_object_dispose__2;
  id v11 = 0;
  skcNode = self->_skcNode;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __15__SKNode_scene__block_invoke;
  v5[3] = &unk_263FE9F18;
  v5[4] = &v6;
  SKCNode::walkUp((uint64_t)skcNode, v5, 1);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SKScene *)v3;
}

void __15__SKNode_scene__block_invoke(uint64_t a1, id *lpsrc, unsigned char *a3)
{
  if (lpsrc
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), lpsrc[1]);
      *a3 = 1;
    }
  }
}

- (SKNode)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = WeakRetained;
  }
  else {
    id v3 = 0;
  }

  return (SKNode *)v3;
}

- (CGPath)outline
{
  (*(void (**)(PKPath **__return_ptr))(*(void *)self->_skcNode + 136))(&v4);
  if (v4)
  {
    id v2 = (CGPath *)*((void *)v4 + 4);
    if (!v2)
    {
      PKPath::createPath(v4);
      id v2 = (CGPath *)*((void *)v4 + 4);
    }
  }
  else
  {
    id v2 = 0;
  }
  if (v5) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v5);
  }
  return v2;
}

- (BOOL)inParentHierarchy:(SKNode *)parent
{
  uint64_t v4 = parent;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id WeakRetained = (SKNode *)objc_loadWeakRetained((id *)&self->_parent);
    p_isa = (id *)&WeakRetained->super.super.isa;
    BOOL v7 = WeakRetained != 0;
    if (WeakRetained != v4 && WeakRetained != 0)
    {
      do
      {
        id v9 = p_isa;
        p_isa = (id *)objc_loadWeakRetained(p_isa + 4);

        BOOL v7 = p_isa != 0;
      }
      while (p_isa != (id *)v4 && p_isa != 0);
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)addChild:(SKNode *)node
{
  uint64_t v4 = node;
  [(SKNode *)self insertChild:v4 atIndex:[(NSMutableArray *)self->_children count]];
}

- (void)insertChild:(SKNode *)node atIndex:(NSInteger)index
{
  uint64_t v6 = node;
  p_isa = (id *)&v6->super.super.isa;
  if (self->_children)
  {
    if (v6) {
      goto LABEL_3;
    }
LABEL_6:
    [MEMORY[0x263EFF940] raise:@"Attemped to add nil node", @"Attemped to add nil node to parent: %@", self format];
    goto LABEL_21;
  }
  id v9 = (NSMutableArray *)objc_opt_new();
  children = self->_children;
  self->_children = v9;

  if (!p_isa) {
    goto LABEL_6;
  }
LABEL_3:
  id WeakRetained = objc_loadWeakRetained(p_isa + 4);

  if (WeakRetained)
  {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"Attemped to add a SKNode which already has a parent: %@", p_isa format];
  }
  else
  {
    [p_isa setParent:self];
    [(SKNode *)self willChangeValueForKey:@"children"];
    SKCNode::insertChildAtIndex((SKCNode *)self->_skcNode, (SKCNode *)[p_isa _backingNode], index);
    [(NSMutableArray *)self->_children insertObject:p_isa atIndex:index];
    id v11 = [(SKNode *)self scene];
    if (v11)
    {
      uint64_t v12 = [p_isa physicsBody];

      if (v12)
      {
        id v13 = [v11 physicsWorld];
        uint64_t v14 = [p_isa physicsBody];
        [v13 addBody:v14];

        uint64_t v15 = [p_isa _backingNode];
        (*(void (**)(uint64_t))(*(void *)v15 + 200))(v15);
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v16 = p_isa;
        uint64_t v17 = [v11 physicsWorld];
        uint64_t v18 = [v16 field];
        [v17 addField:v18];
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [p_isa _connectToScene:v11];
      }
      uint64_t v19 = [p_isa constraints];
      uint64_t v20 = v19;
      if (v19 && [v19 count]) {
        [v11 _registerConstraintsForNode:p_isa];
      }
      if ([p_isa hasChildren])
      {
        v21[0] = MEMORY[0x263EF8330];
        v21[1] = 3221225472;
        v21[2] = __30__SKNode_insertChild_atIndex___block_invoke;
        v21[3] = &unk_263FEA020;
        id v22 = v11;
        [p_isa enumerateChildNodesWithName:@".//SKNode" usingBlock:v21];
      }
    }
    [(SKNode *)self didChangeValueForKey:@"children"];
  }
LABEL_21:
}

void __30__SKNode_insertChild_atIndex___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  id v3 = [v12 physicsBody];

  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) physicsWorld];
    double v5 = [v12 physicsBody];
    [v4 addBody:v5];

    uint64_t v6 = [v12 _backingNode];
    (*(void (**)(uint64_t))(*(void *)v6 + 200))(v6);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v12;
    uint64_t v8 = [*(id *)(a1 + 32) physicsWorld];
    id v9 = [v7 field];
    [v8 addField:v9];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [v12 _connectToScene:*(void *)(a1 + 32)];
  }
  id v10 = [v12 constraints];
  id v11 = v10;
  if (v10 && [v10 count]) {
    [*(id *)(a1 + 32) _registerConstraintsForNode:v12];
  }
}

- (CGRect)frame
{
  *(double *)v2.i64 = (*(double (**)(void *, SEL))(*(void *)self->_skcNode + 120))(self->_skcNode, a2);
  v13.columns[0] = v2;
  v13.columns[1] = v3;
  v13.columns[2] = v4;
  v13.columns[3] = v5;
  float32x4_t AABB = SKCBoundingBoxGetAABB(&v13);
  float32x4_t v7 = (float32x4_t)vdupq_n_s32(0x447A0000u);
  float32x4_t v8 = vdivq_f32(vrndxq_f32(vmulq_f32(AABB, v7)), v7);
  double v9 = v8.f32[0];
  double v10 = v8.f32[1];
  double v11 = v8.f32[2];
  double v12 = v8.f32[3];
  result.size.height = v12;
  result.size.width = v11;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (void)removeChildAtIndex:(int64_t)a3
{
  [(SKNode *)self willChangeValueForKey:@"children"];
  uint64_t v6 = [(NSMutableArray *)self->_children objectAtIndex:a3];
  simd_float4 v5 = [(SKNode *)self scene];
  _removeChild(self, v6, v5);

  [(NSMutableArray *)self->_children removeObjectAtIndex:a3];
  [(SKNode *)self didChangeValueForKey:@"children"];
}

- (void)removeChild:(id)a3
{
  simd_float4 v5 = (SKNode *)a3;
  if (v5)
  {
    [(SKNode *)self willChangeValueForKey:@"children"];
    simd_float4 v4 = [(SKNode *)self scene];
    _removeChild(self, v5, v4);

    [(NSMutableArray *)self->_children removeExactObject:v5];
    [(SKNode *)self didChangeValueForKey:@"children"];
  }
}

- (void)removeChildrenInArray:(NSArray *)nodes
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  simd_float4 v4 = nodes;
  if (v4 && self->_children)
  {
    id v23 = v4;
    [(SKNode *)self willChangeValueForKey:@"children"];
    simd_float4 v5 = [(SKNode *)self scene];
    uint64_t v6 = self;
    float32x4_t v7 = v4;
    float32x4_t v8 = v5;
    id v24 = [(SKScene *)v8 _pkPhysicsWorld];
    double v9 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[NSArray count](v7, "count"));
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    double v10 = v7;
    uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v30 != v12) {
            objc_enumerationMutation(v10);
          }
          uint64_t v14 = *(SKNode **)(*((void *)&v29 + 1) + 8 * i);
          uint64_t v15 = [(SKNode *)v14 parent];
          BOOL v16 = v15 == v6;

          if (v16)
          {
            [v9 addObject:v14];
            _removeChild(v6, v14, v8);
          }
        }
        uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v11);
    }

    if (([v24 hasBodies] & 1) != 0
      || ([v24 hasFields] & 1) != 0
      || [(SKScene *)v8 _hasConstraints]
      || ([(SKScene *)v8 avAudioEnvironmentNode],
          uint64_t v17 = objc_claimAutoreleasedReturnValue(),
          BOOL v18 = v17 == 0,
          v17,
          !v18))
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v19 = v9;
      uint64_t v20 = [v19 countByEnumeratingWithState:&v25 objects:v33 count:16];
      if (v20)
      {
        uint64_t v21 = *(void *)v26;
        do
        {
          for (uint64_t j = 0; j != v20; ++j)
          {
            if (*(void *)v26 != v21) {
              objc_enumerationMutation(v19);
            }
            _unhookPhysicsAndConstraints(*(SKNode **)(*((void *)&v25 + 1) + 8 * j), v8);
          }
          uint64_t v20 = [v19 countByEnumeratingWithState:&v25 objects:v33 count:16];
        }
        while (v20);
      }
    }
    simd_float4 v4 = v23;
    [(NSMutableArray *)self->_children removeExactObjectsInArray:v10];
    [(SKNode *)v6 didChangeValueForKey:@"children"];
  }
}

- (void)removeAllChildren
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (self->_children)
  {
    [(SKNode *)self willChangeValueForKey:@"children"];
    [(NSMutableDictionary *)self->_keyedSubSprites removeAllObjects];
    simd_float4 v3 = (void *)[(NSMutableArray *)self->_children copy];
    long long v8 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v9;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v4);
          }
          -[SKNode removeChild:](self, "removeChild:", *(void *)(*((void *)&v8 + 1) + 8 * v7++), (void)v8);
        }
        while (v5 != v7);
        uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }

    [(SKNode *)self didChangeValueForKey:@"children"];
  }
}

- (void)setConstraints:(NSArray *)constraints
{
  long long v8 = constraints;
  id v4 = (NSArray *)[(NSArray *)v8 copy];
  uint64_t v5 = self->_constraints;
  self->_constraints = v4;

  uint64_t v6 = [(SKNode *)self scene];
  if (v6)
  {
    uint64_t v7 = self->_constraints;
    if (v7 && [(NSArray *)v7 count]) {
      [v6 _registerConstraintsForNode:self];
    }
    else {
      [v6 _removeConstraintsForNode:self];
    }
  }
  SKCNode::recomputeFlags((SKCNode *)self->_skcNode, 1);
}

- (NSArray)constraints
{
  simd_float4 v2 = (void *)[(NSArray *)self->_constraints copy];

  return (NSArray *)v2;
}

- (void)addChild:(id)a3 withKey:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = [(NSMutableDictionary *)self->_keyedSubSprites objectForKey:v6];
    if (v7)
    {
      [(NSMutableDictionary *)self->_keyedSubSprites removeObjectForKey:v6];
      [(SKNode *)self removeChild:v7];
    }
    if (v11)
    {
      [(SKNode *)self addChild:v11];
      keyedSubSprites = self->_keyedSubSprites;
      if (!keyedSubSprites)
      {
        long long v9 = (NSMutableDictionary *)objc_opt_new();
        long long v10 = self->_keyedSubSprites;
        self->_keyedSubSprites = v9;

        keyedSubSprites = self->_keyedSubSprites;
      }
      [(NSMutableDictionary *)keyedSubSprites setObject:v11 forKey:v6];
    }
  }
}

- (SKNode)childNodeWithName:(NSString *)name
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  long long v9 = __Block_byref_object_copy__2;
  long long v10 = __Block_byref_object_dispose__2;
  id v11 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __28__SKNode_childNodeWithName___block_invoke;
  v5[3] = &unk_263FEA0E0;
  v5[4] = &v6;
  [(SKNode *)self enumerateChildNodesWithName:name usingBlock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SKNode *)v3;
}

void __28__SKNode_childNodeWithName___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
}

- (void)enumerateChildNodesWithName:(NSString *)name usingBlock:(void *)block
{
  char v4 = 0;
  [(SKNode *)self _enumerateChildNodesWithName:name usingBlock:block stopPointer:&v4];
}

- (NSArray)objectForKeyedSubscript:(NSString *)name
{
  char v4 = name;
  char v10 = 0;
  uint64_t v5 = objc_opt_new();
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __34__SKNode_objectForKeyedSubscript___block_invoke;
  v8[3] = &unk_263FEA020;
  id v6 = v5;
  id v9 = v6;
  [(SKNode *)self _enumerateChildNodesWithName:v4 usingBlock:v8 stopPointer:&v10];

  return (NSArray *)v6;
}

uint64_t __34__SKNode_objectForKeyedSubscript___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void)_enumerateChildNodesWithName:(id)a3 usingBlock:(id)a4 stopPointer:(BOOL *)a5
{
  uint64_t v89 = *MEMORY[0x263EF8340];
  id v72 = a3;
  id v8 = a4;
  if (!*a5)
  {
    id v71 = v8;
    id v9 = self;
    [v72 componentsSeparatedByString:@"/"];
    v80 = 0;
    v81 = 0;
    unint64_t v82 = 0;
    long long v76 = 0u;
    long long v77 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 countByEnumeratingWithState:&v76 objects:v88 count:16];
    long long v70 = a5;
    if (!v11) {
      goto LABEL_67;
    }
    uint64_t v12 = *(void *)v77;
    char v13 = 1;
    while (1)
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v77 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v76 + 1) + 8 * v14);
        if (objc_msgSend(v15, "length", v70))
        {
          if ([v15 isEqualToString:@"."])
          {
            BOOL v16 = v81;
            if ((unint64_t)v81 >= v82)
            {
              uint64_t v23 = ((char *)v81 - (char *)v80) >> 4;
              unint64_t v24 = v23 + 1;
              if ((unint64_t)(v23 + 1) >> 60) {
                std::vector<jet_render_op>::__throw_length_error[abi:ne180100]();
              }
              uint64_t v25 = v82 - (void)v80;
              if ((uint64_t)(v82 - (void)v80) >> 3 > v24) {
                unint64_t v24 = v25 >> 3;
              }
              if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFF0) {
                unint64_t v26 = 0xFFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v26 = v24;
              }
              objc_super v87 = &v82;
              long long v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<jet_buffer>>>((uint64_t)&v82, v26);
              long long v29 = &v27[16 * v23];
              *(_DWORD *)long long v29 = 0;
              *((void *)v29 + 1) = 0;
              long long v31 = v80;
              long long v30 = v81;
              uint64_t v32 = (uint64_t)v29;
              if (v81 != (_DWORD *)v80)
              {
                uint64_t v33 = (void **)v81;
                do
                {
                  int v34 = *((_DWORD *)v33 - 4);
                  v33 -= 2;
                  *(_DWORD *)(v32 - 16) = v34;
                  v32 -= 16;
                  uint64_t v35 = v33[1];
                  v33[1] = 0;
                  *(void *)(v32 + 8) = v35;
                }
                while (v33 != v31);
              }
              goto LABEL_51;
            }
            _DWORD *v81 = 0;
            *((void *)v16 + 1) = 0;
            uint64_t v17 = v16 + 4;
            goto LABEL_52;
          }
          if ([v15 isEqualToString:@".."])
          {
            uint64_t v21 = v81;
            if ((unint64_t)v81 < v82)
            {
              int v22 = 2;
              goto LABEL_19;
            }
            uint64_t v46 = ((char *)v81 - (char *)v80) >> 4;
            unint64_t v47 = v46 + 1;
            if ((unint64_t)(v46 + 1) >> 60) {
              std::vector<jet_render_op>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v48 = v82 - (void)v80;
            if ((uint64_t)(v82 - (void)v80) >> 3 > v47) {
              unint64_t v47 = v48 >> 3;
            }
            if ((unint64_t)v48 >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v49 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v49 = v47;
            }
            objc_super v87 = &v82;
            long long v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<jet_buffer>>>((uint64_t)&v82, v49);
            long long v29 = &v27[16 * v46];
            *(_DWORD *)long long v29 = 2;
            *((void *)v29 + 1) = 0;
            long long v31 = v80;
            long long v30 = v81;
            uint64_t v32 = (uint64_t)v29;
            if (v81 != (_DWORD *)v80)
            {
              double v50 = (void **)v81;
              do
              {
                int v51 = *((_DWORD *)v50 - 4);
                v50 -= 2;
                *(_DWORD *)(v32 - 16) = v51;
                v32 -= 16;
                uint64_t v52 = v50[1];
                v50[1] = 0;
                *(void *)(v32 + 8) = v52;
              }
              while (v50 != v31);
            }
LABEL_51:
            uint64_t v17 = v29 + 16;
            v80 = (void **)v32;
            v81 = v29 + 16;
            unint64_t v53 = v82;
            unint64_t v82 = (unint64_t)&v27[16 * v28];
            long long v83 = v31;
            long long v85 = v30;
            unint64_t v86 = v53;
            long long v84 = v31;
            std::__split_buffer<Token>::~__split_buffer((uint64_t)&v83);
            goto LABEL_52;
          }
          Token::Token((Token *)&v74, (NSString *)v15);
          id v36 = v81;
          if ((unint64_t)v81 >= v82)
          {
            uint64_t v54 = ((char *)v81 - (char *)v80) >> 4;
            unint64_t v55 = v54 + 1;
            if ((unint64_t)(v54 + 1) >> 60) {
              std::vector<jet_render_op>::__throw_length_error[abi:ne180100]();
            }
            uint64_t v56 = v82 - (void)v80;
            if ((uint64_t)(v82 - (void)v80) >> 3 > v55) {
              unint64_t v55 = v56 >> 3;
            }
            if ((unint64_t)v56 >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v57 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v57 = v55;
            }
            objc_super v87 = &v82;
            long long v58 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<jet_buffer>>>((uint64_t)&v82, v57);
            long long v60 = &v58[16 * v54];
            *(_DWORD *)long long v60 = v74;
            id v61 = v75;
            id v75 = 0;
            *((void *)v60 + 1) = v61;
            long long v63 = v80;
            long long v62 = v81;
            uint64_t v64 = (uint64_t)v60;
            if (v81 != (_DWORD *)v80)
            {
              long long v65 = (void **)v81;
              do
              {
                int v66 = *((_DWORD *)v65 - 4);
                v65 -= 2;
                *(_DWORD *)(v64 - 16) = v66;
                v64 -= 16;
                long long v67 = v65[1];
                v65[1] = 0;
                *(void *)(v64 + 8) = v67;
              }
              while (v65 != v63);
            }
            uint64_t v38 = v60 + 16;
            v80 = (void **)v64;
            v81 = v60 + 16;
            unint64_t v68 = v82;
            unint64_t v82 = (unint64_t)&v58[16 * v59];
            long long v83 = v63;
            long long v85 = v62;
            unint64_t v86 = v68;
            long long v84 = v63;
            std::__split_buffer<Token>::~__split_buffer((uint64_t)&v83);
          }
          else
          {
            _DWORD *v81 = v74;
            id v37 = v75;
            id v75 = 0;
            *((void *)v36 + 1) = v37;
            uint64_t v38 = v36 + 4;
          }
          v81 = v38;
        }
        else
        {
          if ((v13 & 1) == 0)
          {
            uint64_t v21 = v81;
            if ((unint64_t)v81 >= v82)
            {
              uint64_t v39 = ((char *)v81 - (char *)v80) >> 4;
              unint64_t v40 = v39 + 1;
              if ((unint64_t)(v39 + 1) >> 60) {
                std::vector<jet_render_op>::__throw_length_error[abi:ne180100]();
              }
              uint64_t v41 = v82 - (void)v80;
              if ((uint64_t)(v82 - (void)v80) >> 3 > v40) {
                unint64_t v40 = v41 >> 3;
              }
              if ((unint64_t)v41 >= 0x7FFFFFFFFFFFFFF0) {
                unint64_t v42 = 0xFFFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v42 = v40;
              }
              objc_super v87 = &v82;
              long long v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::shared_ptr<jet_buffer>>>((uint64_t)&v82, v42);
              long long v29 = &v27[16 * v39];
              *(_DWORD *)long long v29 = 1;
              *((void *)v29 + 1) = 0;
              long long v31 = v80;
              long long v30 = v81;
              uint64_t v32 = (uint64_t)v29;
              if (v81 != (_DWORD *)v80)
              {
                id v43 = (void **)v81;
                do
                {
                  int v44 = *((_DWORD *)v43 - 4);
                  v43 -= 2;
                  *(_DWORD *)(v32 - 16) = v44;
                  v32 -= 16;
                  uint64_t v45 = v43[1];
                  v43[1] = 0;
                  *(void *)(v32 + 8) = v45;
                }
                while (v43 != v31);
              }
              goto LABEL_51;
            }
            int v22 = 1;
LABEL_19:
            *uint64_t v21 = v22;
            *((void *)v21 + 1) = 0;
            uint64_t v17 = v21 + 4;
LABEL_52:
            v81 = v17;
            goto LABEL_53;
          }
          while (1)
          {
            BOOL v18 = [(SKNode *)v9 parent];
            BOOL v19 = v18 == 0;

            if (v19) {
              break;
            }
            uint64_t v20 = [(SKNode *)v9 parent];

            id v9 = (SKNode *)v20;
          }
        }
LABEL_53:
        char v13 = 0;
        ++v14;
      }
      while (v14 != v11);
      uint64_t v69 = [v10 countByEnumeratingWithState:&v76 objects:v88 count:16];
      uint64_t v11 = v69;
      char v13 = 0;
      if (!v69)
      {
LABEL_67:

        long long v84 = 0;
        long long v85 = 0;
        long long v83 = (void **)&v84;
        memset(v73, 0, sizeof(v73));
        std::vector<Token>::__init_with_size[abi:ne180100]<Token*,Token*>(v73, (uint64_t)v80, (uint64_t)v81, ((char *)v81 - (char *)v80) >> 4);
        [(SKNode *)v9 _processSearchTokens:v73 visited:&v83 usingBlock:v71 stopPointer:v70];
        id v74 = (void **)v73;
        std::vector<Token>::__destroy_vector::operator()[abi:ne180100](&v74);
        std::__tree<SKNode * {__strong}>::destroy((uint64_t)&v83, v84);
        long long v83 = (void **)&v80;
        std::vector<Token>::__destroy_vector::operator()[abi:ne180100](&v83);

        id v8 = v71;
        break;
      }
    }
  }
}

- (void)_processSearchTokens:()vector<Token visited:(std:(void *)a4 :(id)a5 allocator<Token>> *)a3 usingBlock:(BOOL *)a6 stopPointer:
{
  uint64_t v123 = *MEMORY[0x263EF8340];
  id v10 = (void (**)(id, id *, BOOL *))a5;
  uint64_t v11 = self;
  p_isa = (id *)&v11->super.super.isa;
  v116 = (id *)&v11->super.super.isa;
  var0 = a3->var0;
  var1 = a3->var1;
  BOOL v16 = (Token *)((char *)a3->var0 + 16);
  int v15 = *(_DWORD *)a3->var0;
  if (v16 == var1)
  {
    switch(v15)
    {
      case 0:
        if (!*a6)
        {
          BOOL v19 = (void *)*((void *)a4 + 1);
          if (!v19) {
            goto LABEL_74;
          }
          uint64_t v20 = (char *)a4 + 8;
          do
          {
            unint64_t v21 = v19[4];
            BOOL v22 = v21 >= (unint64_t)v11;
            if (v21 >= (unint64_t)v11) {
              uint64_t v23 = v19;
            }
            else {
              uint64_t v23 = v19 + 1;
            }
            if (v22) {
              uint64_t v20 = v19;
            }
            BOOL v19 = (void *)*v23;
          }
          while (*v23);
          if (v20 == (void *)((char *)a4 + 8) || v20[4] > (unint64_t)v11) {
            goto LABEL_74;
          }
        }
        break;
      case 2:
        double v50 = [(SKNode *)v11 parent];

        if (v50)
        {
          int v51 = [v116 parent];
          uint64_t v52 = v116;
          v116 = v51;
        }
        if (!*a6)
        {
          unint64_t v53 = (void *)*((void *)a4 + 1);
          if (!v53) {
            goto LABEL_74;
          }
          uint64_t v54 = (char *)a4 + 8;
          do
          {
            unint64_t v55 = v53[4];
            BOOL v56 = v55 >= (unint64_t)v116;
            if (v55 >= (unint64_t)v116) {
              unint64_t v57 = v53;
            }
            else {
              unint64_t v57 = v53 + 1;
            }
            if (v56) {
              uint64_t v54 = v53;
            }
            unint64_t v53 = (void *)*v57;
          }
          while (*v57);
          if (v54 == (void *)((char *)a4 + 8) || (unint64_t)v116 < v54[4])
          {
LABEL_74:
            std::__tree<SKNode * {__strong}>::__emplace_unique_key_args<SKNode * {__strong},SKNode * const {__strong}&>((uint64_t **)a4, (unint64_t *)&v116, (id *)&v116);
            v10[2](v10, v116, a6);
          }
        }
        break;
      case 3:
        if (v11->_children)
        {
          id v58 = *((id *)var0 + 1);
          v114 = 0;
          v113 = 0;
          uint64_t v115 = 0;
          long long v109 = 0u;
          long long v110 = 0u;
          long long v111 = 0u;
          long long v112 = 0u;
          id v59 = p_isa[5];
          uint64_t v60 = [v59 countByEnumeratingWithState:&v109 objects:v122 count:16];
          if (v60)
          {
            uint64_t v61 = *(void *)v110;
            long long v62 = (char *)a4 + 8;
            do
            {
              for (uint64_t i = 0; i != v60; ++i)
              {
                if (*(void *)v110 != v61) {
                  objc_enumerationMutation(v59);
                }
                uint64_t v64 = *(void ***)(*((void *)&v109 + 1) + 8 * i);
                v117 = (char **)v64;
                long long v65 = *(void **)v62;
                if (!*(void *)v62) {
                  goto LABEL_139;
                }
                int v66 = (char *)a4 + 8;
                do
                {
                  unint64_t v67 = v65[4];
                  BOOL v68 = v67 >= (unint64_t)v64;
                  if (v67 >= (unint64_t)v64) {
                    uint64_t v69 = v65;
                  }
                  else {
                    uint64_t v69 = v65 + 1;
                  }
                  if (v68) {
                    int v66 = (char *)v65;
                  }
                  long long v65 = (void *)*v69;
                }
                while (*v69);
                if (v66 == v62 || (unint64_t)v64 < *((void *)v66 + 4))
                {
LABEL_139:
                  if (SKNodeNameMatches(v58, v64))
                  {
                    std::__tree<SKNode * {__strong}>::__emplace_unique_key_args<SKNode * {__strong},SKNode * const {__strong}&>((uint64_t **)a4, (unint64_t *)&v117, (id *)&v117);
                    std::vector<UITouch * {__strong}>::push_back[abi:ne180100](&v113, (id *)&v117);
                  }
                }
              }
              uint64_t v60 = [v59 countByEnumeratingWithState:&v109 objects:v122 count:16];
            }
            while (v60);
          }

          if (!*a6 && v113 != v114)
          {
            long long v70 = v113 + 8;
            do
            {
              v10[2](v10, *((id **)v70 - 1), a6);
              BOOL v71 = *a6 || v70 == v114;
              v70 += 8;
            }
            while (!v71);
          }
          v117 = &v113;
          std::vector<UITouch * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&v117);
        }
        break;
      case 4:
        if (v11->_children)
        {
          id v72 = (NSString *)*((id *)var0 + 1);
          unint64_t v86 = v10;
          NSClassFromString(v72);
          v114 = 0;
          v113 = 0;
          uint64_t v115 = 0;
          long long v105 = 0u;
          long long v106 = 0u;
          long long v107 = 0u;
          long long v108 = 0u;
          id v73 = v116[5];
          uint64_t v74 = [v73 countByEnumeratingWithState:&v105 objects:v121 count:16];
          if (v74)
          {
            uint64_t v75 = *(void *)v106;
            long long v76 = (char *)a4 + 8;
            do
            {
              for (uint64_t j = 0; j != v74; ++j)
              {
                if (*(void *)v106 != v75) {
                  objc_enumerationMutation(v73);
                }
                long long v78 = *(void ***)(*((void *)&v105 + 1) + 8 * j);
                v117 = (char **)v78;
                long long v79 = *(void **)v76;
                if (!*(void *)v76) {
                  goto LABEL_123;
                }
                v80 = (char *)a4 + 8;
                do
                {
                  unint64_t v81 = v79[4];
                  BOOL v82 = v81 >= (unint64_t)v78;
                  if (v81 >= (unint64_t)v78) {
                    long long v83 = v79;
                  }
                  else {
                    long long v83 = v79 + 1;
                  }
                  if (v82) {
                    v80 = (char *)v79;
                  }
                  long long v79 = (void *)*v83;
                }
                while (*v83);
                if (v80 == v76 || (unint64_t)v78 < *((void *)v80 + 4))
                {
LABEL_123:
                  if (SKNodeNameMatches(v72, v78) || (objc_opt_isKindOfClass() & 1) != 0)
                  {
                    std::__tree<SKNode * {__strong}>::__emplace_unique_key_args<SKNode * {__strong},SKNode * const {__strong}&>((uint64_t **)a4, (unint64_t *)&v117, (id *)&v117);
                    std::vector<UITouch * {__strong}>::push_back[abi:ne180100](&v113, (id *)&v117);
                  }
                }
              }
              uint64_t v74 = [v73 countByEnumeratingWithState:&v105 objects:v121 count:16];
            }
            while (v74);
          }

          id v10 = v86;
          if (!*a6 && v113 != v114)
          {
            long long v84 = v113 + 8;
            do
            {
              v86[2](v86, *((id **)v84 - 1), a6);
              BOOL v85 = *a6 || v84 == v114;
              v84 += 8;
            }
            while (!v85);
          }
          v117 = &v113;
          std::vector<UITouch * {__strong}>::__destroy_vector::operator()[abi:ne180100]((void ***)&v117);
        }
        break;
      default:
        break;
    }
  }
  else
  {
    switch(v15)
    {
      case 0:
        v114 = 0;
        v113 = 0;
        uint64_t v115 = 0;
        std::vector<Token>::__init_with_size[abi:ne180100]<std::__wrap_iter<Token const*>,std::__wrap_iter<Token const*>>(&v113, (uint64_t)v16, (uint64_t)var1, (var1 - v16) >> 4);
        uint64_t v17 = v116;
        memset(v104, 0, sizeof(v104));
        std::vector<Token>::__init_with_size[abi:ne180100]<Token*,Token*>(v104, (uint64_t)v113, (uint64_t)v114, (v114 - v113) >> 4);
        BOOL v18 = (void **)v104;
        [v17 _processSearchTokens:v104 visited:a4 usingBlock:v10 stopPointer:a6];
        goto LABEL_34;
      case 1:
        if (!*a6)
        {
          v114 = 0;
          v113 = 0;
          uint64_t v115 = 0;
          std::vector<Token>::__init_with_size[abi:ne180100]<std::__wrap_iter<Token const*>,std::__wrap_iter<Token const*>>(&v113, (uint64_t)v16, (uint64_t)var1, (var1 - v16) >> 4);
          unint64_t v24 = v116;
          memset(v102, 0, sizeof(v102));
          std::vector<Token>::__init_with_size[abi:ne180100]<Token*,Token*>(v102, (uint64_t)v113, (uint64_t)v114, (v114 - v113) >> 4);
          [v24 _processSearchTokens:v102 visited:a4 usingBlock:v10 stopPointer:a6];
          v117 = (char **)v102;
          std::vector<Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&v117);
          v117 = &v113;
          std::vector<Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&v117);
          p_isa = v116;
        }
        id v25 = p_isa[5];
        if (v25)
        {
          long long v100 = 0u;
          long long v101 = 0u;
          long long v98 = 0u;
          long long v99 = 0u;
          id v26 = v25;
          uint64_t v27 = [v26 countByEnumeratingWithState:&v98 objects:v120 count:16];
          if (v27)
          {
            uint64_t v28 = *(void *)v99;
            do
            {
              for (uint64_t k = 0; k != v27; ++k)
              {
                if (*(void *)v99 != v28) {
                  objc_enumerationMutation(v26);
                }
                if (!*a6)
                {
                  long long v30 = *(void **)(*((void *)&v98 + 1) + 8 * k);
                  memset(v97, 0, sizeof(v97));
                  std::vector<Token>::__init_with_size[abi:ne180100]<Token*,Token*>(v97, (uint64_t)a3->var0, (uint64_t)a3->var1, (a3->var1 - a3->var0) >> 4);
                  [v30 _processSearchTokens:v97 visited:a4 usingBlock:v10 stopPointer:a6];
                  v113 = (char *)v97;
                  std::vector<Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&v113);
                }
              }
              uint64_t v27 = [v26 countByEnumeratingWithState:&v98 objects:v120 count:16];
            }
            while (v27);
          }
        }
        break;
      case 2:
        long long v31 = [(SKNode *)v11 parent];

        if (v31)
        {
          uint64_t v32 = [v116 parent];
          uint64_t v33 = v116;
          v116 = v32;
        }
        int v34 = a3->var1;
        uint64_t v115 = 0;
        v113 = 0;
        v114 = 0;
        std::vector<Token>::__init_with_size[abi:ne180100]<std::__wrap_iter<Token const*>,std::__wrap_iter<Token const*>>(&v113, (uint64_t)v16, (uint64_t)v34, (v34 - v16) >> 4);
        uint64_t v35 = v116;
        memset(v103, 0, sizeof(v103));
        std::vector<Token>::__init_with_size[abi:ne180100]<Token*,Token*>(v103, (uint64_t)v113, (uint64_t)v114, (v114 - v113) >> 4);
        BOOL v18 = (void **)v103;
        [v35 _processSearchTokens:v103 visited:a4 usingBlock:v10 stopPointer:a6];
LABEL_34:
        v117 = (char **)v18;
        std::vector<Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&v117);
        v117 = &v113;
        std::vector<Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&v117);
        break;
      case 3:
        if (v11->_children)
        {
          id v36 = *((id *)var0 + 1);
          id v37 = a3->var1;
          uint64_t v115 = 0;
          v113 = 0;
          v114 = 0;
          std::vector<Token>::__init_with_size[abi:ne180100]<std::__wrap_iter<Token const*>,std::__wrap_iter<Token const*>>(&v113, (uint64_t)v16, (uint64_t)v37, (v37 - v16) >> 4);
          long long v95 = 0u;
          long long v96 = 0u;
          long long v94 = 0u;
          long long v93 = 0u;
          id v38 = v116[5];
          uint64_t v39 = [v38 countByEnumeratingWithState:&v93 objects:v119 count:16];
          if (v39)
          {
            uint64_t v40 = *(void *)v94;
            do
            {
              for (uint64_t m = 0; m != v39; ++m)
              {
                if (*(void *)v94 != v40) {
                  objc_enumerationMutation(v38);
                }
                if (!*a6)
                {
                  unint64_t v42 = *(void **)(*((void *)&v93 + 1) + 8 * m);
                  if (SKNodeNameMatches(v36, v42))
                  {
                    memset(v92, 0, sizeof(v92));
                    std::vector<Token>::__init_with_size[abi:ne180100]<Token*,Token*>(v92, (uint64_t)v113, (uint64_t)v114, (v114 - v113) >> 4);
                    [v42 _processSearchTokens:v92 visited:a4 usingBlock:v10 stopPointer:a6];
                    v117 = (char **)v92;
                    std::vector<Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&v117);
                  }
                }
              }
              uint64_t v39 = [v38 countByEnumeratingWithState:&v93 objects:v119 count:16];
            }
            while (v39);
          }

          v117 = &v113;
          std::vector<Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&v117);
        }
        break;
      case 4:
        if (v11->_children)
        {
          id v43 = (NSString *)*((id *)var0 + 1);
          NSClassFromString(v43);
          int v44 = a3->var1;
          uint64_t v115 = 0;
          v113 = 0;
          v114 = 0;
          std::vector<Token>::__init_with_size[abi:ne180100]<std::__wrap_iter<Token const*>,std::__wrap_iter<Token const*>>(&v113, (uint64_t)v16, (uint64_t)v44, (v44 - v16) >> 4);
          long long v90 = 0u;
          long long v91 = 0u;
          long long v88 = 0u;
          long long v89 = 0u;
          id v45 = v116[5];
          uint64_t v46 = [v45 countByEnumeratingWithState:&v88 objects:v118 count:16];
          if (v46)
          {
            uint64_t v47 = *(void *)v89;
            do
            {
              for (uint64_t n = 0; n != v46; ++n)
              {
                if (*(void *)v89 != v47) {
                  objc_enumerationMutation(v45);
                }
                if (!*a6)
                {
                  unint64_t v49 = *(void **)(*((void *)&v88 + 1) + 8 * n);
                  if (SKNodeNameMatches(v43, v49) || (objc_opt_isKindOfClass() & 1) != 0)
                  {
                    memset(v87, 0, sizeof(v87));
                    std::vector<Token>::__init_with_size[abi:ne180100]<Token*,Token*>(v87, (uint64_t)v113, (uint64_t)v114, (v114 - v113) >> 4);
                    [v49 _processSearchTokens:v87 visited:a4 usingBlock:v10 stopPointer:a6];
                    v117 = (char **)v87;
                    std::vector<Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&v117);
                  }
                }
              }
              uint64_t v46 = [v45 countByEnumeratingWithState:&v88 objects:v118 count:16];
            }
            while (v46);
          }

          v117 = &v113;
          std::vector<Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&v117);
        }
        break;
      default:
        break;
    }
  }
}

- (BOOL)hasChildren
{
  return [(NSMutableArray *)self->_children count] != 0;
}

- (NSArray)children
{
  childreuint64_t n = self->_children;
  if (children)
  {
    id v3 = (void *)[(NSMutableArray *)children copy];
  }
  else
  {
    id v3 = [MEMORY[0x263EFF8C0] array];
  }

  return (NSArray *)v3;
}

- (id)_descendants
{
  id v3 = [MEMORY[0x263EFF980] array];
  [(SKNode *)self _descendantsToMutableArray:v3];

  return v3;
}

- (void)_descendantsToMutableArray:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = self->_children;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        objc_msgSend(v4, "addObject:", v9, (void)v10);
        [v9 _descendantsToMutableArray:v4];
      }
      uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (id)_descendantsWithPredicate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x263EFF980] array];
  [(SKNode *)self _descendantsWithPredicate:v4 toMutableArray:v5];

  return v5;
}

- (void)_descendantsWithPredicate:(id)a3 toMutableArray:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v6 = (unsigned int (**)(id, void *))a3;
  id v7 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = self->_children;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v8);
        }
        long long v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (v6[2](v6, v12)) {
          objc_msgSend(v7, "addObject:", v12, (void)v13);
        }
        objc_msgSend(v12, "_descendantsWithPredicate:toMutableArray:", v6, v7, (void)v13);
      }
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)runAction:(SKAction *)action
{
  id v4 = action;
  if (v4)
  {
    uint64_t v6 = v4;
    id v5 = [(SKAction *)v4 copy];
    [(SKNode *)self _runAction:v5];

    id v4 = v6;
  }
}

- (void)_runAction:(id)a3
{
  id v4 = a3;
  actions = self->_actions;
  id v14 = v4;
  if (!actions)
  {
    uint64_t v6 = (NSMutableArray *)objc_opt_new();
    id v7 = self->_actions;
    self->_actions = v6;

    actions = self->_actions;
    id v4 = v14;
  }
  [(NSMutableArray *)actions addObject:v4];
  id v8 = (SKCAction *)[v14 caction];
  (*((void (**)(SKCAction *, float))v8->var0 + 5))(v8, *((float *)self->_skcNode + 42));
  skcNode = self->_skcNode;
  uint64_t v10 = operator new(0x18uLL);
  v10[2] = v8;
  uint64_t v11 = skcNode[22];
  skcNode += 22;
  void *v10 = v11;
  v10[1] = skcNode;
  *(void *)(v11 + 8) = v10;
  void *skcNode = v10;
  ++skcNode[2];
  long long v12 = (SKCNode *)self->_skcNode;
  double v13 = skCurrentTime();
  SKCAction::wasAddedToTargetAtTime(v8, v12, v13);
  SKCNode::recomputeFlags((SKCNode *)self->_skcNode, 1);
}

- (void)runAction:(SKAction *)action completion:(void *)block
{
  uint64_t v11 = action;
  uint64_t v6 = block;
  if (v11)
  {
    id v7 = [(SKAction *)v11 copy];
    uint64_t v8 = MEMORY[0x21052F3F0](v6);
    uint64_t v9 = [v7 caction];
    uint64_t v10 = *(void **)(v9 + 80);
    *(void *)(v9 + 80) = v8;

    [(SKNode *)self _runAction:v7];
  }
}

- (void)setSpeed:(CGFloat)speed
{
  float v3 = speed;
  skcNode = (float *)self->_skcNode;
  skcNode[42] = v3;
  SKCNode::recomputeFlags((SKCNode *)skcNode, 1);
}

- (CGFloat)speed
{
  return *((float *)self->_skcNode + 42);
}

- (CGFloat)alpha
{
  return *((float *)self->_skcNode + 81);
}

- (void)setAlpha:(CGFloat)alpha
{
  skcNode = (SKCNode *)self->_skcNode;
  float v4 = alpha;
  float v5 = v4;
  SKCNode::setAlpha(skcNode, &v5);
}

- (void)runAction:(SKAction *)action withKey:(NSString *)key
{
  uint64_t v11 = action;
  uint64_t v6 = key;
  if (v6)
  {
    [(SKNode *)self removeActionForKey:v6];
    if (v11)
    {
      id v7 = [(SKAction *)v11 copy];
      keyedActions = self->_keyedActions;
      if (!keyedActions)
      {
        uint64_t v9 = (NSMutableDictionary *)objc_opt_new();
        uint64_t v10 = self->_keyedActions;
        self->_keyedActions = v9;

        keyedActions = self->_keyedActions;
      }
      [(NSMutableDictionary *)keyedActions setObject:v7 forKey:v6];
      [(SKNode *)self _runAction:v7];
    }
  }
}

- (SKAction)actionForKey:(NSString *)key
{
  float v4 = key;
  if (v4)
  {
    float v5 = [(NSMutableDictionary *)self->_keyedActions objectForKey:v4];
    if ([(NSMutableArray *)self->_actions containsObject:v5]) {
      goto LABEL_5;
    }
    [(NSMutableDictionary *)self->_keyedActions removeObjectForKey:v4];
  }
  float v5 = 0;
LABEL_5:

  return (SKAction *)v5;
}

- (void)removeActionForKey:(NSString *)key
{
  float v4 = key;
  if (v4)
  {
    id v7 = v4;
    float v5 = [(NSMutableDictionary *)self->_keyedActions objectForKey:v4];
    uint64_t v6 = v5;
    if (v5)
    {
      SKCNode::removeAction((SKCNode *)self->_skcNode, (SKCAction *)[v5 caction]);
      [(NSMutableDictionary *)self->_keyedActions removeObjectForKey:v7];
    }

    float v4 = v7;
  }
}

- (void)removeAllActions
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  actions = self->_actions;
  if (actions)
  {
    float v4 = (void *)[(NSMutableArray *)actions copy];
    [(NSMutableDictionary *)self->_keyedActions removeAllObjects];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v5);
          }
          SKCNode::removeAction((SKCNode *)self->_skcNode, (SKCAction *)objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "caction", (void)v9));
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (id)containingView
{
  simd_float4 v2 = self;
  if (v2)
  {
    float v3 = v2;
    while (1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      float v4 = [(SKNode *)v3 parent];

      float v3 = v4;
      if (!v4) {
        goto LABEL_8;
      }
    }
    float v4 = [(SKNode *)v3 view];
  }
  else
  {
    float v4 = 0;
  }
LABEL_8:

  return v4;
}

- (BOOL)hasActions
{
  return [(NSMutableArray *)self->_actions count] != 0;
}

- (BOOL)needsUpdate
{
  return 1;
}

- (NSString)description
{
  float v3 = NSString;
  float v4 = [(id)objc_opt_class() description];
  id v5 = [(SKNode *)self name];
  [(SKNode *)self position];
  uint64_t v6 = NSStringFromCGPoint(v15);
  [(SKNode *)self xScale];
  uint64_t v8 = v7;
  [(SKNode *)self yScale];
  uint64_t v10 = v9;
  [(SKNode *)self calculateAccumulatedFrame];
  long long v11 = NSStringFromCGRect(v16);
  long long v12 = [v3 stringWithFormat:@"<%@> name:'%@' position:%@ scale:{%.2f, %.2f} accumulatedFrame:%@", v4, v5, v6, v8, v10, v11];

  return (NSString *)v12;
}

- (void)setPhysicsBody:(SKPhysicsBody *)physicsBody
{
  uint64_t v9 = physicsBody;
  if (*((SKPhysicsBody **)self->_skcNode + 29) != v9)
  {
    id v5 = [(SKNode *)self scene];
    uint64_t v6 = (void *)*((void *)self->_skcNode + 29);
    if (v6)
    {
      [v6 setRepresentedObject:0];
      if (v5)
      {
        uint64_t v7 = [v5 physicsWorld];
        [v7 removeBody:*((void *)self->_skcNode + 29)];
      }
    }
    objc_storeStrong((id *)self->_skcNode + 29, physicsBody);
    if (v9)
    {
      [(SKPhysicsBody *)v9 setRepresentedObject:self];
      [(SKPhysicsBody *)v9 setPostStepBlock:&__block_literal_global_5];
      *((__n128 *)self->_skcNode + 15) = SKCNode::getScale((__n128 *)self->_skcNode);
      (*(void (**)(void *))(*(void *)self->_skcNode + 200))(self->_skcNode);
      if (v5)
      {
        uint64_t v8 = [v5 physicsWorld];
        [v8 addBody:v9];
      }
    }
    SKCNode::recomputeFlags((SKCNode *)self->_skcNode, 1);
  }
}

- (SKPhysicsBody)physicsBody
{
  return (SKPhysicsBody *)*((id *)self->_skcNode + 29);
}

- (id)physicsField
{
  return 0;
}

- (CGPoint)position
{
  float64x2_t v2 = vcvtq_f64_f32((float32x2_t)SKCNode::getTranslation((__n128 *)self->_skcNode).n128_u64[0]);
  double v3 = v2.f64[1];
  result.x = v2.f64[0];
  result.y = v3;
  return result;
}

- (void)setPosition:(CGPoint)position
{
  *(float *)&position.x = position.x;
  float y = position.y;
  SKCNode::setTranslation((SKCNode *)self->_skcNode, (__n128)position, y);
}

- (CGRect)calculateAccumulatedFrame
{
  v12.columns[0] = (simd_float4)SKCNode::getAccumulatedBoundingBox((char **)self->_skcNode);
  v12.columns[1] = v2;
  v12.columns[2] = v3;
  v12.columns[3] = v4;
  float32x4_t AABB = SKCBoundingBoxGetAABB(&v12);
  float32x4_t v6 = (float32x4_t)vdupq_n_s32(0x447A0000u);
  float32x4_t v7 = vdivq_f32(vrndxq_f32(vmulq_f32(AABB, v6)), v6);
  double v8 = v7.f32[0];
  double v9 = v7.f32[1];
  double v10 = v7.f32[2];
  double v11 = v7.f32[3];
  result.size.height = v11;
  result.size.width = v10;
  result.origin.float y = v9;
  result.origin.x = v8;
  return result;
}

- (CGFloat)zPosition
{
  return SKCNode::getZTranslation((SKCNode *)self->_skcNode);
}

- (void)setZPosition:(CGFloat)zPosition
{
  float v3 = zPosition;
  SKCNode::setZTranslation((SKCNode *)self->_skcNode, v3);
}

- (CGFloat)zRotation
{
  return COERCE_FLOAT(SKCNode::getRotation((__n128 *)self[24]).n128_u32[2]);
}

- (void)setZRotation:(CGFloat)zRotation
{
  float v3 = zRotation;
  SKCNode::setZRotation((SKCNode *)self->_skcNode, v3);
}

- (double)xRotation
{
  return SKCNode::getRotation((__n128 *)self->_skcNode).n128_f32[0];
}

- (void)setXRotation:(double)a3
{
  Rotatiouint64_t n = SKCNode::getRotation((__n128 *)self->_skcNode);
  float v5 = a3;
  Rotation.n128_f32[0] = v5;
  skcNode = (SKCNode *)self->_skcNode;

  SKCNode::setRotation(skcNode, Rotation);
}

- (double)yRotation
{
  return COERCE_FLOAT(SKCNode::getRotation((__n128 *)self[24]).n128_u32[1]);
}

- (void)setYRotation:(double)a3
{
  Rotatiouint64_t n = SKCNode::getRotation((__n128 *)self->_skcNode);
  float v5 = a3;
  Rotation.n128_f32[1] = v5;
  skcNode = (SKCNode *)self->_skcNode;

  SKCNode::setRotation(skcNode, Rotation);
}

- (CGFloat)xScale
{
  return SKCNode::getScale((__n128 *)self->_skcNode).n128_f32[0];
}

- (void)setXScale:(CGFloat)xScale
{
  [(SKNode *)self willChangeValueForKey:@"size"];
  __n128 Scale = SKCNode::getScale((__n128 *)self->_skcNode);
  float v6 = xScale;
  Scale.n128_f32[0] = v6;
  SKCNode::setScale((SKCNode *)self->_skcNode, Scale);

  [(SKNode *)self didChangeValueForKey:@"size"];
}

- (CGFloat)yScale
{
  return COERCE_FLOAT(SKCNode::getScale((__n128 *)self[24]).n128_u32[1]);
}

- (void)setYScale:(CGFloat)yScale
{
  [(SKNode *)self willChangeValueForKey:@"size"];
  __n128 Scale = SKCNode::getScale((__n128 *)self->_skcNode);
  float v6 = yScale;
  Scale.n128_f32[1] = v6;
  SKCNode::setScale((SKCNode *)self->_skcNode, Scale);

  [(SKNode *)self didChangeValueForKey:@"size"];
}

- (void)setScale:(CGFloat)scale
{
  -[SKNode setXScale:](self, "setXScale:");

  [(SKNode *)self setYScale:scale];
}

- (BOOL)isHidden
{
  return *((unsigned char *)self->_skcNode + 280);
}

- (void)setHidden:(BOOL)hidden
{
}

- (BOOL)isPaused
{
  return *((unsigned char *)self->_skcNode + 172);
}

- (void)setPaused:(BOOL)paused
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  skcNode = self->_skcNode;
  if ((skcNode[172] != 0) != paused)
  {
    BOOL v5 = paused;
    (*(void (**)(unsigned char *, BOOL))(*(void *)skcNode + 160))(skcNode, paused);
    double v6 = skCurrentTime();
    float32x4_t v7 = (void *)[(NSMutableArray *)self->_actions copy];
    double v8 = self->_children;
    if (*((unsigned char *)self->_skcNode + 172))
    {
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v9 = v7;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v31 objects:v37 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v32 != v11) {
              objc_enumerationMutation(v9);
            }
            double v13 = *(void **)(*((void *)&v31 + 1) + 8 * i);
            if (([v13 finished] & 1) == 0) {
              SKCAction::wasPausedWithTargetAtTime((SKCAction *)[v13 caction], (SKCNode *)self->_skcNode, v6);
            }
          }
          uint64_t v10 = [v9 countByEnumeratingWithState:&v31 objects:v37 count:16];
        }
        while (v10);
      }
    }
    else
    {
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v14 = v7;
      uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v36 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v28;
        do
        {
          for (uint64_t j = 0; j != v15; ++j)
          {
            if (*(void *)v28 != v16) {
              objc_enumerationMutation(v14);
            }
            uint64_t v18 = *(void **)(*((void *)&v27 + 1) + 8 * j);
            if (([v18 finished] & 1) == 0) {
              SKCAction::willResumeWithTargetAtTime((SKCAction *)[v18 caction], (SKCNode *)self->_skcNode, v6);
            }
          }
          uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v36 count:16];
        }
        while (v15);
      }
    }

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    BOOL v19 = v8;
    uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v23 objects:v35 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v24;
      do
      {
        for (uint64_t k = 0; k != v20; ++k)
        {
          if (*(void *)v24 != v21) {
            objc_enumerationMutation(v19);
          }
          objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * k), "setPaused:", v5, (void)v23);
        }
        uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v23 objects:v35 count:16];
      }
      while (v20);
    }
  }
}

- (BOOL)isUserInteractionEnabled
{
  return self->_userInteractionEnabled;
}

- (void)setUserInteractionEnabled:(BOOL)userInteractionEnabled
{
  self->_userInteractionEnabled = userInteractionEnabled;
}

- (BOOL)containsPoint:(CGPoint)p
{
  CGFloat y = p.y;
  CGFloat x = p.x;
  [(SKNode *)self calculateAccumulatedFrame];
  CGFloat v9 = x;
  CGFloat v10 = y;

  return CGRectContainsPoint(*(CGRect *)&v5, *(CGPoint *)&v9);
}

- (BOOL)containsPoint:(CGPoint)a3 withRadius:(double)a4
{
  double y = a3.y;
  double x = a3.x;
  [(SKNode *)self calculateAccumulatedFrame];
  *(float *)&double v9 = v9;
  *(float *)&double v10 = v10;
  float v11 = x;
  float v12 = vabds_f32(v11, *(float *)&v9);
  float v13 = *(float *)&v10 * 0.5;
  if (v13 + a4 < v12) {
    return 0;
  }
  float v14 = v7;
  float v15 = v8;
  float v16 = y;
  float v17 = vabds_f32(v16, v14);
  float v18 = v15 * 0.5;
  if (v18 + a4 < v17) {
    return 0;
  }
  return v12 <= v13
      || v17 <= v18
      || a4 * a4 >= (float)((float)((float)(v17 - v13) * (float)(v17 - v13))
                          + (float)((float)(v12 - v18) * (float)(v12 - v18)));
}

- (id)nodeAtPoint:(CGPoint)a3 recursive:(BOOL)a4
{
  simd_float4 v4 = self;
  v5.f32[0] = a3.x;
  float32_t y = a3.y;
  v5.f32[1] = y;
  v5.i32[2] = 0;
  v5.i32[3] = 1.0;
  uint64_t v7 = SKCNode::nodeAtPoint((uint64_t)self->_skcNode, v5);
  if (v7) {
    simd_float4 v4 = *(SKNode **)(v7 + 8);
  }
  double v8 = v4;

  return v8;
}

- (SKNode)nodeAtPoint:(CGPoint)p
{
  float v3 = self;
  v4.f32[0] = p.x;
  float32_t y = p.y;
  v4.f32[1] = y;
  v4.i32[2] = 0;
  v4.i32[3] = 1.0;
  uint64_t v6 = SKCNode::nodeAtPoint((uint64_t)self->_skcNode, v4);
  if (v6) {
    float v3 = *(SKNode **)(v6 + 8);
  }
  uint64_t v7 = v3;

  return v7;
}

- (NSArray)nodesAtPoint:(CGPoint)p
{
  uint64_t v9 = (uint64_t)&v9;
  double v10 = &v9;
  skcNode = self->_skcNode;
  v4.f32[0] = p.x;
  float32_t y = p.y;
  v4.f32[1] = y;
  uint64_t v11 = 0;
  v4.i32[2] = 0;
  v4.i32[3] = 1.0;
  SKCNode::sortedNodesAtPoint((uint64_t)skcNode, &v9, v4);
  uint64_t v6 = [MEMORY[0x263EFF980] array];
  for (uint64_t i = v10; i != &v9; uint64_t i = (uint64_t *)i[1])
    [v6 addObject:*(void *)(i[2] + 8)];
  std::__list_imp<SKCRenderSortInfo *>::clear(&v9);

  return (NSArray *)v6;
}

- (CGPoint)convertPointFromParent:(CGPoint)a3
{
  float x = a3.x;
  float v11 = x;
  float y = a3.y;
  float v12 = y;
  *(double *)v5.i64 = (*(double (**)(void *, SEL))(*(void *)self->_skcNode + 112))(self->_skcNode, a2);
  float64x2_t v9 = vcvtq_f64_f32(vadd_f32(v8, (float32x2_t)*(_OWORD *)&vmlaq_f32(vmlaq_n_f32(vmulq_n_f32(v5, v11), v6, v12), (float32x4_t)0, v7)));
  double v10 = v9.f64[1];
  result.float x = v9.f64[0];
  result.float y = v10;
  return result;
}

- (CGPoint)convertPointToParent:(CGPoint)a3
{
  float x = a3.x;
  float v11 = x;
  float y = a3.y;
  float v12 = y;
  *(double *)v5.i64 = (*(double (**)(void *, SEL))(*(void *)self->_skcNode + 104))(self->_skcNode, a2);
  float64x2_t v9 = vcvtq_f64_f32(vadd_f32(v8, (float32x2_t)*(_OWORD *)&vmlaq_f32(vmlaq_n_f32(vmulq_n_f32(v5, v11), v6, v12), (float32x4_t)0, v7)));
  double v10 = v9.f64[1];
  result.float x = v9.f64[0];
  result.float y = v10;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)point fromNode:(SKNode *)node
{
  double y = point.y;
  double x = point.x;
  float32x4_t v7 = node;
  float32x2_t v8 = v7;
  if (v7 && v7 != self)
  {
    skcNode = (SKCNode *)self->_skcNode;
    double v10 = [(SKNode *)v7 _backingNode];
    float32_t v11 = y;
    v12.f32[0] = x;
    v12.f32[1] = v11;
    v12.i32[2] = 0;
    v12.i32[3] = 1.0;
    double v13 = SKCNode::convertPointFromNode(skcNode, v10, v12);
    double x = *(float *)&v13;
    double y = *((float *)&v13 + 1);
  }

  double v14 = x;
  double v15 = y;
  result.double y = v15;
  result.double x = v14;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)point toNode:(SKNode *)node
{
  double y = point.y;
  double x = point.x;
  float32x4_t v7 = node;
  float32x2_t v8 = v7;
  if (v7 && v7 != self)
  {
    skcNode = (SKCNode *)self->_skcNode;
    double v10 = [(SKNode *)v7 _backingNode];
    float32_t v11 = y;
    v12.f32[0] = x;
    v12.f32[1] = v11;
    v12.i32[2] = 0;
    v12.i32[3] = 1.0;
    double v13 = SKCNode::convertPointToNode(skcNode, v10, v12);
    double x = *(float *)&v13;
    double y = *((float *)&v13 + 1);
  }

  double v14 = x;
  double v15 = y;
  result.double y = v15;
  result.double x = v14;
  return result;
}

- (CGSize)size
{
  float64x2_t v2 = vcvtq_f64_f32(vmul_f32(*(float32x2_t *)((char *)self->_skcNode + 336), (float32x2_t)(SKCNode::getScale((__n128 *)self->_skcNode).n128_u64[0] & 0x7FFFFFFF7FFFFFFFLL)));
  double v3 = v2.f64[1];
  result.width = v2.f64[0];
  result.height = v3;
  return result;
}

- (BOOL)intersectsNode:(SKNode *)node
{
  return [(SKNode *)self intersectsNode:node useAlphaTest:0];
}

- (BOOL)hasUniformAlphaAndIsVisible
{
  return 1;
}

- (void)dealloc
{
  skcNode = self->_skcNode;
  if (skcNode) {
    (*(void (**)(void *, SEL))(*(void *)skcNode + 88))(skcNode, a2);
  }
  [(NSMutableArray *)self->_children removeAllObjects];
  v4.receiver = self;
  v4.super_class = (Class)SKNode;
  [(SKNode *)&v4 dealloc];
}

- (double)globalBoundingVerts
{
  *(double *)v1.i64 = SKCNode::getWorldBoundingBox(*(SKCNode ***)(a1 + 24));
  v6.columns[0] = v1;
  v6.columns[1] = v2;
  v6.columns[2] = v3;
  v6.columns[3] = v4;
  return SKCBoundingBoxGetVerts(&v6);
}

- (double)globalAccumulatedBoundingVerts
{
  *(double *)v1.i64 = SKCNode::getWorldAccumulatedBoundingBox(*(char ***)(a1 + 24));
  v6.columns[0] = v1;
  v6.columns[1] = v2;
  v6.columns[2] = v3;
  v6.columns[3] = v4;
  return SKCBoundingBoxGetVerts(&v6);
}

- (NSDictionary)attributeValues
{
  attributeValues = self->_attributeValues;
  if (!attributeValues)
  {
    simd_float4 v4 = [MEMORY[0x263EFF9A0] dictionary];
    float32x4_t v5 = self->_attributeValues;
    self->_attributeValues = v4;

    attributeValues = self->_attributeValues;
  }
  simd_float4x4 v6 = (void *)[(NSMutableDictionary *)attributeValues copy];

  return (NSDictionary *)v6;
}

- (void)setAttributeValues:(NSDictionary *)attributeValues
{
  simd_float4 v4 = attributeValues;
  double v10 = v4;
  if (!self->_attributeValues)
  {
    float32x4_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    simd_float4x4 v6 = self->_attributeValues;
    self->_attributeValues = v5;

    simd_float4 v4 = v10;
  }
  float32x4_t v7 = (NSMutableDictionary *)[(NSDictionary *)v4 mutableCopy];
  float32x2_t v8 = self->_attributeValues;
  self->_attributeValues = v7;

  skcNode = (SKCNode *)self->_skcNode;
  *((unsigned char *)skcNode + 16) = 1;
  SKCNode::setFlags(skcNode, 2, 1);
}

- (SKAttributeValue)valueForAttributeNamed:(NSString *)key
{
  simd_float4 v4 = key;
  attributeValues = self->_attributeValues;
  if (!attributeValues)
  {
    simd_float4x4 v6 = [MEMORY[0x263EFF9A0] dictionary];
    float32x4_t v7 = self->_attributeValues;
    self->_attributeValues = v6;

    attributeValues = self->_attributeValues;
  }
  float32x2_t v8 = [(NSMutableDictionary *)attributeValues objectForKey:v4];

  return (SKAttributeValue *)v8;
}

- (void)setValue:(SKAttributeValue *)value forAttributeNamed:(NSString *)key
{
  double v13 = value;
  simd_float4x4 v6 = key;
  float32x4_t v7 = v13;
  float32x2_t v8 = v6;
  attributeValues = self->_attributeValues;
  if (!attributeValues)
  {
    objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v13);
    double v10 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    float32_t v11 = self->_attributeValues;
    self->_attributeValues = v10;

    attributeValues = self->_attributeValues;
    float32x4_t v7 = v13;
  }
  [(NSMutableDictionary *)attributeValues setObject:v7 forKey:v8];
  skcNode = (SKCNode *)self->_skcNode;
  *((unsigned char *)skcNode + 16) = 1;
  SKCNode::setFlags(skcNode, 64, 1);
}

- (void)setNeedsFocusUpdate
{
  id v3 = [NSClassFromString(&cfstr_Uifocussystem.isa) focusSystemForEnvironment:self];
  [v3 requestFocusUpdateToEnvironment:self];
}

- (void)updateFocusIfNeeded
{
  id v2 = [NSClassFromString(&cfstr_Uifocussystem.isa) focusSystemForEnvironment:self];
  [v2 updateFocusIfNeeded];
}

- (BOOL)canBecomeFocused
{
  return self->_focusBehavior == 2;
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  return 1;
}

- (NSArray)preferredFocusEnvironments
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = self;
  id v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];

  return (NSArray *)v2;
}

- (BOOL)_isEffectivelyHidden
{
  id v3 = [(SKNode *)self parent];
  if (([v3 _isEffectivelyHidden] & 1) != 0 || -[SKNode isHidden](self, "isHidden"))
  {
    BOOL v4 = 1;
  }
  else
  {
    [(SKNode *)self alpha];
    BOOL v4 = v5 <= 0.00000011920929;
  }

  return v4;
}

- (BOOL)_isEligibleForFocus
{
  if ([(SKNode *)self isUserInteractionEnabled]) {
    int v3 = ![(SKNode *)self _isEffectivelyHidden];
  }
  else {
    int v3 = 0;
  }
  if ([(SKNode *)self canBecomeFocused]) {
    BOOL v4 = self->_focusBehavior == 0;
  }
  else {
    BOOL v4 = 0;
  }
  char v5 = SKGetLinkedOnOrAfter(720896) ^ 1 | v4;
  BOOL result = v5 & v3;
  if ((v5 & 1) == 0 && ((v3 ^ 1) & 1) == 0) {
    return self->_focusBehavior != 0;
  }
  return result;
}

- (id)focusItemsInRect:(CGRect)a3
{
  return (id)MEMORY[0x263EFFA68];
}

- (CGPoint)convertPoint:(CGPoint)cgpoint toCoordinateSpace:(id)a4
{
  double y = cgpoint.y;
  double x = cgpoint.x;
  id v7 = a4;
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      -[SKNode convertPoint:toNode:](self, "convertPoint:toNode:", v7, x, y);
      double x = v8;
      double y = v9;
    }
    else
    {
      double v10 = [(SKNode *)self scene];
      uint64_t v11 = [(SKScene *)v10 view];
      float32x4_t v12 = (SKView *)v11;
      if (v10 && v11)
      {
        -[SKNode convertPoint:toNode:](self, "convertPoint:toNode:", v10, x, y);
        [(SKView *)v12 convertPoint:v7 toCoordinateSpace:CGPointConvertFromSceneToView(v10, v12, v17).n128_f64[0]];
        double x = v13;
        double y = v14;
      }
    }
  }

  double v15 = x;
  double v16 = y;
  result.double y = v16;
  result.double x = v15;
  return result;
}

- (CGPoint)convertPoint:(CGPoint)cgpoint fromCoordinateSpace:(id)a4
{
  double y = cgpoint.y;
  double x = cgpoint.x;
  id v7 = a4;
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      -[SKNode convertPoint:fromNode:](self, "convertPoint:fromNode:", v7, x, y);
      double x = v8;
      double y = v9;
    }
    else
    {
      double v10 = [(SKNode *)self scene];
      uint64_t v11 = [(SKScene *)v10 view];
      float32x4_t v12 = v11;
      if (v10 && v11)
      {
        -[SKView convertPoint:fromCoordinateSpace:](v11, "convertPoint:fromCoordinateSpace:", v7, x, y);
        [(SKNode *)self convertPoint:v10 fromNode:CGPointConvertFromViewToScene(v12, v10, v17).n128_f64[0]];
        double x = v13;
        double y = v14;
      }
    }
  }

  double v15 = x;
  double v16 = y;
  result.double y = v16;
  result.double x = v15;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 toCoordinateSpace:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v9 = a4;
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v25);
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  -[SKNode convertPoint:toCoordinateSpace:](self, "convertPoint:toCoordinateSpace:", v9, MinX, CGRectGetMinY(v26));
  double v12 = v11;
  double v14 = v13;
  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v27);
  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size.CGFloat width = width;
  v28.size.CGFloat height = height;
  -[SKNode convertPoint:toCoordinateSpace:](self, "convertPoint:toCoordinateSpace:", v9, MaxX, CGRectGetMaxY(v28));
  double v17 = v16;
  double v19 = v18;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    double v20 = v14;
  }
  else {
    double v20 = v19;
  }

  double v21 = v12;
  double v22 = v20;
  double v23 = vabdd_f64(v12, v17);
  double v24 = vabdd_f64(v14, v19);
  result.size.CGFloat height = v24;
  result.size.CGFloat width = v23;
  result.origin.CGFloat y = v22;
  result.origin.CGFloat x = v21;
  return result;
}

- (CGRect)convertRect:(CGRect)a3 fromCoordinateSpace:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v9 = a4;
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  double MinX = CGRectGetMinX(v25);
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  -[SKNode convertPoint:fromCoordinateSpace:](self, "convertPoint:fromCoordinateSpace:", v9, MinX, CGRectGetMinY(v26));
  double v12 = v11;
  double v14 = v13;
  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  double MaxX = CGRectGetMaxX(v27);
  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size.CGFloat width = width;
  v28.size.CGFloat height = height;
  -[SKNode convertPoint:fromCoordinateSpace:](self, "convertPoint:fromCoordinateSpace:", v9, MaxX, CGRectGetMaxY(v28));
  double v17 = v16;
  double v19 = v18;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    double v20 = v14;
  }
  else {
    double v20 = v19;
  }

  double v21 = v12;
  double v22 = v20;
  double v23 = vabdd_f64(v12, v17);
  double v24 = vabdd_f64(v14, v19);
  result.size.CGFloat height = v24;
  result.size.CGFloat width = v23;
  result.origin.CGFloat y = v22;
  result.origin.CGFloat x = v21;
  return result;
}

+ (id)debugHierarchyChildGroupingID
{
  return @"com.apple.SpriteKit.SKNode";
}

+ (id)debugHierarchyObjectsInGroupWithID:(id)a3 onObject:(id)a4 outOptions:(id *)a5
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"com.apple.SpriteKit.SKNode"])
  {
    double v8 = [v7 children];

    if (v8)
    {
      double v8 = [v7 children];
    }
  }
  else
  {
    double v8 = 0;
  }

  return v8;
}

+ (id)debugHierarchyPropertyDescriptions
{
  v35[18] = *MEMORY[0x263EF8340];
  id v2 = (const CFDictionaryKeyCallBacks *)MEMORY[0x263EFFB78];
  int v3 = (const CFDictionaryValueCallBacks *)MEMORY[0x263EFFF90];
  Mutable = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(Mutable, @"propertyName", @"alpha");
  CFDictionaryAddValue(Mutable, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(Mutable, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(Mutable, @"propertyFormat", @"CGf");
  long long v33 = Mutable;
  v35[0] = Mutable;
  char v5 = CFDictionaryCreateMutable(0, 7, v2, v3);
  CFDictionaryAddValue(v5, @"propertyName", @"constraints");
  CFDictionaryAddValue(v5, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(v5, @"propertyFormat", @"objectInfo");
  long long v32 = v5;
  v35[1] = v5;
  id v6 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v6, @"propertyName", @"frame");
  CFDictionaryAddValue(v6, @"propertyRuntimeType", @"CGRect");
  CFDictionaryAddValue(v6, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeRect");
  CFDictionaryAddValue(v6, @"propertyFormat", @"CGf, CGf, CGf, CGf");
  long long v31 = v6;
  v35[2] = v6;
  id v7 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v7, @"propertyName", @"hidden");
  CFDictionaryAddValue(v7, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v7, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v7, @"propertyFormat", @"b");
  long long v30 = v7;
  v35[3] = v7;
  double v8 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v8, @"propertyName", @"name");
  CFDictionaryAddValue(v8, @"propertyRuntimeType", @"NSString");
  CFDictionaryAddValue(v8, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeString");
  if (*MEMORY[0x263F01AF0]) {
    CFDictionaryAddValue(v8, @"propertyFormat", (const void *)*MEMORY[0x263F01AF0]);
  }
  long long v29 = v8;
  v35[4] = v8;
  id v9 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v9, @"propertyName", @"paused");
  CFDictionaryAddValue(v9, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v9, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v9, @"propertyFormat", @"b");
  CGRect v28 = v9;
  v35[5] = v9;
  double v10 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v10, @"propertyName", @"physicsBody");
  CFDictionaryAddValue(v10, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(v10, @"propertyFormat", @"objectInfo");
  CGRect v27 = v10;
  v35[6] = v10;
  double v11 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v11, @"propertyName", @"position");
  CFDictionaryAddValue(v11, @"propertyRuntimeType", @"CGPoint");
  CFDictionaryAddValue(v11, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypePoint");
  CFDictionaryAddValue(v11, @"propertyFormat", @"CGf, CGf");
  CGRect v26 = v11;
  v35[7] = v11;
  double v12 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v12, @"propertyName", @"reachConstraints");
  CFDictionaryAddValue(v12, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(v12, @"propertyFormat", @"objectInfo");
  CGRect v25 = v12;
  v35[8] = v12;
  double v13 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v13, @"propertyName", @"speed");
  CFDictionaryAddValue(v13, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v13, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v13, @"propertyFormat", @"CGf");
  v35[9] = v13;
  double v14 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v14, @"propertyName", @"userData");
  CFDictionaryAddValue(v14, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeObjectInfo");
  CFDictionaryAddValue(v14, @"propertyFormat", @"objectInfo");
  v35[10] = v14;
  double v15 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v15, @"propertyName", @"userInteractionEnabled");
  CFDictionaryAddValue(v15, @"propertyRuntimeType", @"BOOL");
  CFDictionaryAddValue(v15, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeBool");
  CFDictionaryAddValue(v15, @"propertyFormat", @"b");
  v35[11] = v15;
  double v16 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v16, @"propertyName", @"xScale");
  CFDictionaryAddValue(v16, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v16, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v16, @"propertyFormat", @"CGf");
  v35[12] = v16;
  double v17 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v17, @"propertyName", @"yScale");
  CFDictionaryAddValue(v17, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v17, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v17, @"propertyFormat", @"CGf");
  v35[13] = v17;
  double v18 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v18, @"propertyName", @"zPosition");
  CFDictionaryAddValue(v18, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v18, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v18, @"propertyFormat", @"CGf");
  v35[14] = v18;
  double v19 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v19, @"propertyName", @"zRotation");
  CFDictionaryAddValue(v19, @"propertyRuntimeType", @"CGFloat");
  CFDictionaryAddValue(v19, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeNumber");
  CFDictionaryAddValue(v19, @"propertyFormat", @"CGf");
  v35[15] = v19;
  double v20 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v20, @"propertyName", @"anchorPoint");
  CFDictionaryAddValue(v20, @"propertyRuntimeType", @"CGPoint");
  CFDictionaryAddValue(v20, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypePoint");
  CFDictionaryAddValue(v20, @"propertyFormat", @"CGf, CGf");
  v35[16] = v20;
  double v21 = CFDictionaryCreateMutable(0, 7, MEMORY[0x263EFFB78], MEMORY[0x263EFFF90]);
  CFDictionaryAddValue(v21, @"propertyName", @"untransformedSize");
  CFDictionaryAddValue(v21, @"propertyRuntimeType", @"CGSize");
  CFDictionaryAddValue(v21, @"propertyLogicalType", @"DebugHierarchyLogicalPropertyTypeSize");
  CFDictionaryAddValue(v21, @"propertyFormat", @"CGf, CGf");
  uint64_t valuePtr = 8;
  CFNumberRef v22 = CFNumberCreate(0, kCFNumberCFIndexType, &valuePtr);
  CFDictionaryAddValue(v21, @"visibility", v22);
  CFRelease(v22);
  v35[17] = v21;
  double v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:18];

  return v23;
}

+ (id)debugHierarchyValueForPropertyWithName:(id)a3 onObject:(id)a4 outOptions:(id *)a5 outError:(id *)a6
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if ([v8 isEqualToString:@"anchorPoint"])
  {
    [v9 _anchorPoint];
    uint64_t v41 = v10;
    unint64_t v42 = v11;
    double v12 = (const void **)malloc_type_malloc(0x10uLL, 0x6004044C4A2DFuLL);
    uint64_t v13 = 0;
    char v14 = 1;
    do
    {
      char v15 = v14;
      CFNumberRef v16 = CFNumberCreate(0, kCFNumberCGFloatType, &v41 + v13);
      char v14 = 0;
      v12[v13] = v16;
      uint64_t v13 = 1;
    }
    while ((v15 & 1) != 0);
LABEL_8:
    a6 = (id *)CFArrayCreate(0, v12, 2, MEMORY[0x263EFFF70]);
    CFRelease(*v12);
    CFRelease(v12[1]);
    free(v12);
    goto LABEL_30;
  }
  if ([v8 isEqualToString:@"untransformedSize"])
  {
    [v9 _untransformedSize];
    uint64_t v41 = v17;
    unint64_t v42 = v18;
    double v12 = (const void **)malloc_type_malloc(0x10uLL, 0x6004044C4A2DFuLL);
    uint64_t v19 = 0;
    char v20 = 1;
    do
    {
      char v21 = v20;
      CFNumberRef v22 = CFNumberCreate(0, kCFNumberCGFloatType, &v41 + v19);
      char v20 = 0;
      v12[v19] = v22;
      uint64_t v19 = 1;
    }
    while ((v21 & 1) != 0);
    goto LABEL_8;
  }
  id v39 = v9;
  id v23 = v8;
  if (![v23 length]) {
    goto LABEL_20;
  }
  NSSelectorFromString((NSString *)v23);
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if ((unint64_t)[v23 length] < 2)
    {
      CGRect v28 = [v23 uppercaseString];
    }
    else
    {
      CGRect v25 = [v23 substringToIndex:1];
      CGRect v26 = [v25 uppercaseString];
      CGRect v27 = [v23 substringFromIndex:1];
      CGRect v28 = [v26 stringByAppendingString:v27];
    }
    long long v29 = [@"is" stringByAppendingString:v28];
    NSSelectorFromString(v29);
    if (objc_opt_respondsToSelector()) {
      double v24 = v29;
    }
    else {
      double v24 = 0;
    }

    if (v24) {
      goto LABEL_12;
    }
LABEL_20:
    if (a6)
    {
      id v30 = v39;
      long long v31 = (__CFString *)v23;
      if (v30)
      {
        long long v32 = [NSString stringWithFormat:@"%@", v30];
      }
      else
      {
        long long v32 = &stru_26BEEFD10;
      }
      if (v31) {
        long long v33 = v31;
      }
      else {
        long long v33 = &stru_26BEEFD10;
      }
      long long v34 = v33;
      v40[0] = @"propertyName";
      v40[1] = @"objectDescription";
      uint64_t v41 = v34;
      unint64_t v42 = v32;
      v40[2] = @"errorDescription";
      id v43 = &stru_26BEEFD10;
      uint64_t v35 = [NSDictionary dictionaryWithObjects:&v41 forKeys:v40 count:3];
      id v36 = [MEMORY[0x263F087E8] errorWithDomain:@"DebugHierarchyErrorDomain" code:100 userInfo:v35];

      id v37 = v36;
      *a6 = v37;

      double v24 = 0;
      a6 = 0;
    }
    else
    {
      double v24 = 0;
    }
    goto LABEL_29;
  }
  double v24 = (NSString *)v23;
  if (!v24) {
    goto LABEL_20;
  }
LABEL_12:
  a6 = [v39 valueForKey:v24];
LABEL_29:

LABEL_30:

  return a6;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(NSString *)name
{
}

- (SKReachConstraints)reachConstraints
{
  return self->_reachConstraints;
}

- (void)setReachConstraints:(SKReachConstraints *)reachConstraints
{
}

- (SKNodeFocusBehavior)focusBehavior
{
  return self->_focusBehavior;
}

- (void)setFocusBehavior:(SKNodeFocusBehavior)focusBehavior
{
  self->_focusBehavior = focusBehavior;
}

- (NSMutableDictionary)userData
{
  return self->_userData;
}

- (void)setUserData:(NSMutableDictionary *)userData
{
}

- (GKEntity)entity
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_entity);

  return (GKEntity *)WeakRetained;
}

- (void)setEntity:(GKEntity *)entity
{
}

- (BOOL)performFullCapture
{
  return self->_performFullCapture;
}

- (void)setPerformFullCapture:(BOOL)a3
{
  self->_performFullCapture = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_entity);
  objc_storeStrong((id *)&self->_reachConstraints, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_userData, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_attributeValues, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_keyedSubSprites, 0);
  objc_storeStrong((id *)&self->_keyedActions, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_children, 0);

  objc_destroyWeak((id *)&self->_parent);
}

+ (id)nodeFromCaptureData:(id)a3
{
  v13[8] = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v12 = 0;
  BOOL v4 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v3 error:&v12];
  id v5 = v12;
  [v4 setRequiresSecureCoding:0];
  id v6 = +[SKCaptureUnarchiverDelegate sharedInstance];
  [v4 setDelegate:v6];

  id v7 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  v13[2] = objc_opt_class();
  v13[3] = objc_opt_class();
  v13[4] = objc_opt_class();
  v13[5] = objc_opt_class();
  v13[6] = objc_opt_class();
  v13[7] = objc_opt_class();
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:8];
  [v7 addObjectsFromArray:v8];

  id v9 = [v4 decodeObjectOfClasses:v7 forKey:*MEMORY[0x263F081D0]];
  [v4 finishDecoding];
  double v10 = [v9 objectForKey:@"node"];

  return v10;
}

- (id)createFullCaptureData
{
  v8[1] = *MEMORY[0x263EF8340];
  id v7 = @"node";
  v8[0] = self;
  id v2 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  id v3 = +[SKFrameCaptureDelegate sharedInstance];
  BOOL v4 = (void *)[objc_alloc(MEMORY[0x263F08910]) initRequiringSecureCoding:1];
  [v4 setDelegate:v3];
  [v4 encodeObject:v2 forKey:*MEMORY[0x263F081D0]];
  [v4 finishEncoding];
  id v5 = [v4 encodedData];

  return v5;
}

- (id)archiveToFile:(id)a3
{
  id v4 = a3;
  id v5 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
  id v6 = [v5 objectAtIndex:0];
  if (!v4)
  {
    id v7 = [MEMORY[0x263EFF910] date];
    id v4 = [v7 description];
  }
  id v8 = [v4 pathExtension];
  uint64_t v9 = [v8 length];

  if (!v9)
  {
    uint64_t v10 = [v4 stringByAppendingPathExtension:@"sks"];

    id v4 = (id)v10;
  }
  double v11 = [v6 stringByAppendingPathComponent:v4];
  id v17 = 0;
  id v12 = [MEMORY[0x263F08910] archivedDataWithRootObject:self requiringSecureCoding:1 error:&v17];
  id v13 = v17;
  if (v13 || ([v12 writeToFile:v11 atomically:1] & 1) == 0) {
    char v14 = @"Failed to archive %@ to %@";
  }
  else {
    char v14 = @"Archived %@ to %@";
  }
  char v15 = objc_msgSend(NSString, "stringWithFormat:", v14, self, v11);
  NSLog(&stru_26BEEFD70.isa, v15);

  return v15;
}

- (void)debugPrint
{
}

- (void)_debugPrint:(int)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (a3 < 1)
  {
    id v7 = &stru_26BEEFD10;
  }
  else
  {
    id v5 = &stru_26BEEFD10;
    int v6 = a3;
    do
    {
      id v7 = [(__CFString *)v5 stringByAppendingString:@"\t"];

      id v5 = v7;
      --v6;
    }
    while (v6);
  }
  NSLog(&cfstr_P_0.isa, v7, self, self);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = [(SKNode *)self children];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v14;
    uint64_t v11 = (a3 + 1);
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v12++) _debugPrint:v11];
      }
      while (v9 != v12);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)_debugPrint:(int)a3 mask:(unint64_t)a4
{
  if (a3 < 1)
  {
    long long v13 = &stru_26BEEFD10;
  }
  else
  {
    int v7 = 0;
    id v8 = &stru_26BEEFD10;
    int v9 = -a3;
    do
    {
      if (v7)
      {
        uint64_t v10 = [(__CFString *)v8 stringByAppendingString:@" "];

        id v8 = (__CFString *)v10;
      }
      if (((1 << v7) & a4) != 0) {
        uint64_t v11 = @"|";
      }
      else {
        uint64_t v11 = @" ";
      }
      if (v9 + v7 == -1) {
        uint64_t v12 = @"|";
      }
      else {
        uint64_t v12 = v11;
      }
      double v24 = [(__CFString *)v8 stringByAppendingString:v12];

      ++v7;
      long long v13 = v24;
      id v8 = v24;
    }
    while (v9 + v7);
  }
  CGRect v25 = v13;
  NSLog(&cfstr_P_1.isa, v13, self, self);
  long long v14 = [(SKNode *)self children];
  uint64_t v15 = [v14 count];
  uint64_t v16 = v15;
  if (v15)
  {
    uint64_t v17 = 0;
    uint64_t v18 = 1 << a3;
    uint64_t v19 = (a3 + 1);
    uint64_t v20 = v15 - 1;
    do
    {
      char v21 = [v14 objectAtIndex:v17];
      CFNumberRef v22 = v21;
      if (v20 == v17) {
        uint64_t v23 = 0;
      }
      else {
        uint64_t v23 = v18;
      }
      [v21 _debugPrint:v19 mask:v23 | a4];

      ++v17;
    }
    while (v16 != v17);
  }
}

- (void)_getWorldTransform:(float *)a3 positionY:(float *)a4 rotation:(float *)a5 xScale:(float *)a6 yScale:(float *)a7
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v12 = 0u;
  SKCNode::resolveWorldPositionRotationAndScale((_OWORD *)self->_skcNode, &v14, &v13, &v12);
  if (a3) {
    *(_DWORD *)a3 = v14;
  }
  if (a4) {
    *a4 = *((float *)&v14 + 1);
  }
  if (a5) {
    *a5 = *((float *)&v13 + 2);
  }
  if (a6) {
    *(_DWORD *)a6 = v12;
  }
  if (a7) {
    *a7 = *((float *)&v12 + 1);
  }
}

- (void)_getBasePhysicsScale:(float *)a3 yScale:(float *)a4
{
  unint64_t v6 = SKCNode::getBasePhysicsScale((__n128 *)self->_skcNode).n128_u64[0];
  if (a3) {
    *(_DWORD *)a3 = v6;
  }
  if (a4) {
    *a4 = *((float *)&v6 + 1);
  }
}

- (void)updatePhysicsPositionAndScaleFromSprite
{
}

- (id)childrenInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double x = a3.origin.x;
  double y = a3.origin.y;
  uint64_t v39 = *MEMORY[0x263EF8340];
  unint64_t v6 = objc_opt_new();
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  int v7 = self->_children;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v8)
  {
    double v9 = x + width;
    double v10 = y + height;
    uint64_t v11 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v35 != v11) {
          objc_enumerationMutation(v7);
        }
        long long v13 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        objc_msgSend(v13, "convertPointFromParent:", x, y, *(void *)&x, *(void *)&y, (void)v34);
        double v15 = v14;
        double v17 = v16;
        objc_msgSend(v13, "convertPointFromParent:", v9, v10);
        double v19 = v18;
        double v21 = v20;
        [v13 _anchorPoint];
        double v23 = v22;
        double v25 = v24;
        [v13 _size];
        v41.size.double width = v26;
        v41.size.double height = v27;
        double v28 = v19 - v15;
        double v29 = v21 - v17;
        v41.origin.double x = -(v26 * v23);
        v41.origin.double y = -(v27 * v25);
        v42.origin.double x = v15;
        v42.origin.double y = v17;
        v42.size.double width = v28;
        v42.size.double height = v29;
        if (CGRectIntersectsRect(v41, v42)) {
          [v6 addObject:v13];
        }
        id v30 = objc_msgSend(v13, "childrenInRect:", v15, v17, v28, v29);
        [v6 addObjectsFromArray:v30];
      }
      uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v8);
  }

  return v6;
}

- (NSMutableDictionary)_info
{
  return self->_info;
}

- (void)set_info:(id)a3
{
}

- (BOOL)_showBounds
{
  return 0;
}

- (CGRect)_untransformedBounds
{
  *(double *)v2.i64 = SKCNode::getUntransformedBoundingBox((SKCNode *)self->_skcNode);
  v13.columns[0] = v2;
  v13.columns[1] = v3;
  v13.columns[2] = v4;
  v13.columns[3] = v5;
  float32x4_t AABB = SKCBoundingBoxGetAABB(&v13);
  float32x4_t v7 = (float32x4_t)vdupq_n_s32(0x447A0000u);
  float32x4_t v8 = vdivq_f32(vrndxq_f32(vmulq_f32(AABB, v7)), v7);
  double v9 = v8.f32[0];
  double v10 = v8.f32[1];
  double v11 = v8.f32[2];
  double v12 = v8.f32[3];
  result.size.double height = v12;
  result.size.double width = v11;
  result.origin.double y = v10;
  result.origin.double x = v9;
  return result;
}

- (CGSize)_untransformedSize
{
  *(double *)v2.i64 = SKCNode::getUntransformedBoundingBox((SKCNode *)self->_skcNode);
  v11.columns[0] = v2;
  v11.columns[1] = v3;
  v11.columns[2] = v4;
  v11.columns[3] = v5;
  float32x4_t AABB = SKCBoundingBoxGetAABB(&v11);
  float32x4_t v7 = (float32x4_t)vdupq_n_s32(0x447A0000u);
  int8x16_t v8 = (int8x16_t)vrndxq_f32(vmulq_f32(AABB, v7));
  float64x2_t v9 = vcvtq_f64_f32(vdiv_f32((float32x2_t)*(_OWORD *)&vextq_s8(v8, v8, 8uLL), *(float32x2_t *)v7.f32));
  double v10 = v9.f64[1];
  result.double width = v9.f64[0];
  result.double height = v10;
  return result;
}

- (CGPoint)_anchorPoint
{
  float64x2_t v2 = vcvtq_f64_f32(*(float32x2_t *)((char *)self->_skcNode + 352));
  double v3 = v2.f64[1];
  result.double x = v2.f64[0];
  result.double y = v3;
  return result;
}

- (void)set_anchorPoint:(CGPoint)a3
{
  skcNode = (SKCNode *)self->_skcNode;
  *(float *)&unsigned int v4 = a3.x;
  *(float *)&unsigned int v5 = a3.y;
  long long v6 = __PAIR64__(v5, v4);
  SKCNode::setAnchor(skcNode, &v6);
}

- (CGSize)_size
{
  float64x2_t v2 = vcvtq_f64_f32(*(float32x2_t *)((char *)self->_skcNode + 336));
  double v3 = v2.f64[1];
  result.double width = v2.f64[0];
  result.double height = v3;
  return result;
}

- (BOOL)intersectsNode:(id)a3 useAlphaTest:(BOOL)a4
{
  id v5 = a3;
  if (v5) {
    BOOL v6 = SKCNode::intersectsNode((SKCNode **)-[SKNode _backingNode](self, "_backingNode"), (SKCNode **)[v5 _backingNode]);
  }
  else {
    BOOL v6 = 0;
  }

  return v6;
}

- (id)allIntersectionsWithNode:(id)a3 useAlphaTest:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v19 = a3;
  id v20 = [MEMORY[0x263EFF9A0] dictionary];
  BOOL v6 = [(SKNode *)self children];
  double v18 = [v6 arrayByAddingObject:self];

  float32x4_t v7 = [v19 children];
  double v24 = [v7 arrayByAddingObject:v19];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obuint64_t j = v18;
  uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v8)
  {
    uint64_t v23 = *(void *)v30;
    do
    {
      uint64_t v9 = 0;
      uint64_t v22 = v8;
      do
      {
        if (*(void *)v30 != v23) {
          objc_enumerationMutation(obj);
        }
        double v10 = *(void **)(*((void *)&v29 + 1) + 8 * v9);
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v11 = v24;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v12)
        {
          simd_float4x4 v13 = 0;
          uint64_t v14 = *(void *)v26;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v26 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void *)(*((void *)&v25 + 1) + 8 * i);
              if ([v10 intersectsNode:v16 useAlphaTest:v4])
              {
                if (!v13)
                {
                  simd_float4x4 v13 = [MEMORY[0x263EFF980] array];
                }
                [v13 addObject:v16];
              }
            }
            uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v33 count:16];
          }
          while (v12);

          uint64_t v8 = v22;
          if (v13) {
            [v20 setObject:v13 forKey:v10];
          }
        }
        else
        {

          simd_float4x4 v13 = 0;
        }

        ++v9;
      }
      while (v9 != v8);
      uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v8);
  }

  return v20;
}

- (id)_subnodeFromIndexPath:(id)a3
{
  id v4 = a3;
  id v5 = self;
  if (v4 && (uint64_t v6 = [v4 length], v6 >= 1))
  {
    uint64_t v7 = 0;
    do
    {
      uint64_t v8 = [(SKNode *)v5 children];
      objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v4, "indexAtPosition:", v7));
      uint64_t v9 = (SKNode *)objc_claimAutoreleasedReturnValue();
      ++v7;

      id v5 = v9;
    }
    while (v6 != v7);
  }
  else
  {
    uint64_t v9 = v5;
  }

  return v9;
}

- (BOOL)_pathFromPhysicsBodyToPoints:(SKNode *)self outSize:(SEL)a2
{
  BOOL result = 0;
  if (v2)
  {
    uint64_t v6 = v3;
    if (v3)
    {
      uint64_t v7 = v2;
      uint64_t v8 = [(SKNode *)self physicsBody];
      uint64_t v9 = [v8 volume];

      if (v9)
      {
        int64_t v10 = *(void *)(v9 + 16) - *(void *)(v9 + 8);
        int64_t *v6 = v10 >> 3;
        *uint64_t v7 = malloc_type_malloc(v10, 0x100004000313F17uLL);
        uint64_t v11 = *(void *)(v9 + 8);
        if (*(void *)(v9 + 16) != v11)
        {
          unint64_t v12 = 0;
          do
          {
            *((void *)*v7 + v12) = *(void *)(v11 + 8 * v12);
            ++v12;
            uint64_t v11 = *(void *)(v9 + 8);
          }
          while (v12 < (*(void *)(v9 + 16) - v11) >> 3);
        }
        PKPath::~PKPath((PKPath *)v9);
        MEMORY[0x21052EA30]();
        return 1;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

- (NSArray)_allActions
{
  actions = self->_actions;
  double v3 = [(NSMutableDictionary *)self->_keyedActions allValues];
  id v4 = [(NSMutableArray *)actions arrayByAddingObjectsFromArray:v3];

  return (NSArray *)v4;
}

- (id)_copyImageData
{
  double v3 = (void *)MEMORY[0x21052F180](self, a2);
  id v4 = -[SKView initWithFrame:]([SKView alloc], "initWithFrame:", 0.0, 0.0, 100.0, 100.0);
  id v5 = v4;
  if (v4)
  {
    uint64_t v6 = [(SKView *)v4 textureFromNode:self];
    uint64_t v7 = (void *)[v6 _copyImageData];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (CGRect)_convertFrameToView:(id)a3
{
  double v3 = CGRectConvertFrameFromNodeToView(self, (SKView *)a3);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (id)createDebugHierarchyVisualRepresentation
{
  keys[1] = *(void **)MEMORY[0x263EF8340];
  float64x2_t v2 = self;
  double v3 = [(SKNode *)v2 scene];
  if (!v3
    || ([(SKNode *)v2 scene],
        double v4 = objc_claimAutoreleasedReturnValue(),
        [v4 view],
        double v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v3,
        !v5))
  {
    uint64_t v8 = v2;
LABEL_7:
    Mutable = 0;
    goto LABEL_49;
  }
  double v6 = [(SKNode *)v2 scene];
  uint64_t v44 = [v6 view];

  id v45 = [(NSKeyedArchiver *)[SKNodeVisualRepresentationArchiver alloc] initRequiringSecureCoding:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = objc_opt_class();
    if (v7 == objc_opt_class()) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v10 = objc_opt_class();
    if (v10 == objc_opt_class()) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = objc_opt_class();
    if (v11 == objc_opt_class()) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v12 = objc_opt_class();
    if (v12 == objc_opt_class()) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v13 = objc_opt_class();
    if (v13 == objc_opt_class()) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v14 = objc_opt_class();
    if (v14 == objc_opt_class()) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v15 = objc_opt_class();
    if (v15 == objc_opt_class()) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v16 = objc_opt_class();
    if (v16 == objc_opt_class()) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v17 = objc_opt_class();
    if (v17 != objc_opt_class())
    {
LABEL_31:
      double v18 = (void *)MEMORY[0x263F08910];
      id v19 = (objc_class *)objc_opt_class();
      id v20 = NSStringFromClass(v19);
      [v18 setClassName:v20 forClass:objc_opt_class()];
    }
  }
LABEL_32:
  [v45 encodeObject:v2 forKey:@"node"];
  [v45 finishEncoding];
  double v21 = [SKNodeVisualRepresentationUnarchiver alloc];
  uint64_t v22 = [v45 encodedData];
  id v46 = 0;
  uint64_t v23 = (void *)[(SKNodeVisualRepresentationUnarchiver *)v21 initForReadingFromData:v22 error:&v46];
  id v42 = v46;

  [v23 setRequiresSecureCoding:0];
  double v24 = [v23 decodeObjectOfClass:objc_opt_class() forKey:@"node"];
  [v23 finishDecoding];
  [v24 removeAllChildren];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v24, "setPosition:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), v42);
    [v24 setXScale:1.0];
    [v24 setYScale:1.0];
    [v24 setZRotation:0.0];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v25 = [(SKNode *)v2 tileSet];
    [v24 setTileSet:v25];
  }
  uint64_t v8 = v24;

  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  [v44 frame];
  char v29 = isKindOfClass ^ 1;
  if (v27 < 1024.0 || v28 < 1024.0)
  {
    if (v27 >= v28) {
      uint64_t v30 = v28;
    }
    else {
      uint64_t v30 = v27;
    }
  }
  else
  {
    uint64_t v30 = 1024;
  }
  v48[0] = @"doNotRenderChildNodes";
  Mutable = (__CFData *)0x263F08000;
  long long v31 = objc_msgSend(NSNumber, "numberWithBool:", v29 & 1, v42);
  v48[1] = @"textureMaxRenderSize";
  v49[0] = v31;
  long long v32 = [NSNumber numberWithUnsignedInt:v30];
  v49[1] = v32;
  long long v33 = [NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:2];
  long long v34 = [v44 textureFromNode:v8 withOptions:v33];

  if (v34)
  {
    uint64_t v35 = (CGImage *)[v34 CGImage];
    if (v35)
    {
      int valuePtr = 1065353216;
      Mutable = CFDataCreateMutable(0, 0);
      long long v36 = CGImageDestinationCreateWithData(Mutable, (CFStringRef)*MEMORY[0x263F01AE0], 1uLL, 0);
      CFAllocatorRef v37 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFNumberRef v38 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], kCFNumberFloatType, &valuePtr);
      uint64_t v39 = (void *)*MEMORY[0x263F0EFE8];
      values = v38;
      keys[0] = v39;
      CFDictionaryRef v40 = CFDictionaryCreate(v37, (const void **)keys, (const void **)&values, 1, 0, 0);
      CGImageDestinationAddImage(v36, v35, v40);
      CGImageDestinationFinalize(v36);
      CFRelease(v40);
      CFRelease(v38);
      CFRelease(v36);
    }
    else
    {
      Mutable = 0;
    }
    CGImageRelease(v35);
  }

  if (!v34) {
    goto LABEL_7;
  }
LABEL_49:

  return Mutable;
}

- (void)setParent:(id)a3
{
  obuint64_t j = (SKNode *)a3;
  if ([(SKNode *)obj inParentHierarchy:self]) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"Setting this node as parent would create a loop: %@", self format];
  }
  if (obj == self) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"A Node can't parent itself: %@", obj format];
  }
  id v4 = objc_storeWeak((id *)&self->_parent, obj);

  if (obj) {
    skcNode = obj->_skcNode;
  }
  else {
    skcNode = 0;
  }
  *((void *)self->_skcNode + 10) = skcNode;
}

@end