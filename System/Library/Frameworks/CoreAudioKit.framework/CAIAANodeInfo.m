@interface CAIAANodeInfo
- (CAIAANodeInfo)init;
- (UIColor)labelColor;
- (id)nodeAtIndex:(unint64_t)a3;
- (id)nodeWithNodeInfo:(id)a3;
- (unint64_t)numNodes;
- (void)refresh;
- (void)setLabelColor:(id)a3;
@end

@implementation CAIAANodeInfo

- (CAIAANodeInfo)init
{
  v5.receiver = self;
  v5.super_class = (Class)CAIAANodeInfo;
  v2 = [(CAIAANodeInfo *)&v5 init];
  v3 = v2;
  if (v2) {
    [(CAIAANodeInfo *)v2 createNodeList];
  }
  return v3;
}

- (id)nodeWithNodeInfo:(id)a3
{
  [MEMORY[0x263F82670] currentDevice];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend((id)objc_msgSend(MEMORY[0x263F82670], "currentDevice"), "userInterfaceIdiom"))
  {
    uint64_t v5 = 0x4053000000000000;
  }
  else
  {
    uint64_t v5 = 0x404E000000000000;
  }
  double v6 = *(double *)&v5;
  v7 = +[CANodeButton buttonWithType:0];
  -[CANodeButton setUrl:](v7, "setUrl:", [a3 url]);
  [(CANodeButton *)v7 setTitle:@"Node" forState:0];
  [(CANodeButton *)v7 setTitleColor:self->labelColor forState:0];
  [(CANodeButton *)v7 setTitleColor:[(UIColor *)self->labelColor colorWithAlphaComponent:0.75] forState:2];
  -[CANodeButton setImage:forState:](v7, "setImage:forState:", [a3 icon], 0);
  -[CANodeButton setFrame:](v7, "setFrame:", 0.0, 0.0, v6 + 12.0, v6 + 24.0);
  objc_msgSend((id)objc_msgSend((id)-[CANodeButton imageView](v7, "imageView"), "layer"), "setCornerRadius:", 8.0);
  objc_msgSend((id)-[CANodeButton titleLabel](v7, "titleLabel"), "setFont:", objc_msgSend(MEMORY[0x263F81708], "systemFontOfSize:", 15.0));
  [(CANodeButton *)v7 setContentMode:2];
  [(CANodeButton *)v7 setHasLabel:0];
  return v7;
}

- (void)refresh
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  nodeList = self->nodeList;
  if (!nodeList)
  {
    nodeList = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->nodeList = nodeList;
  }
  [(NSMutableArray *)nodeList removeAllObjects];
  v4 = (void *)[MEMORY[0x263F28DE0] sharedInstance];
  LODWORD(v5) = 1117257728;
  double v6 = (void *)[v4 getApps:v5];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v12 = [(CAIAANodeInfo *)self nodeWithNodeInfo:v11];
        if ([v11 isCurrentApp])
        {
          [v12 setEnabled:0];
LABEL_12:
          [(NSMutableArray *)self->nodeList addObject:v12];
          continue;
        }
        if ((objc_opt_respondsToSelector() & 1) == 0
          || (objc_msgSend((id)objc_msgSend(v11, "valueForKey:", @"isForeground"), "BOOLValue") & 1) == 0)
        {
          goto LABEL_12;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (unint64_t)numNodes
{
  return [(NSMutableArray *)self->nodeList count];
}

- (void)setLabelColor:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  self->labelColor = (UIColor *)a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  nodeList = self->nodeList;
  uint64_t v5 = [(NSMutableArray *)nodeList countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(nodeList);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        [v9 setTitleColor:a3 forState:0];
        objc_msgSend(v9, "setTitleColor:forState:", objc_msgSend(a3, "colorWithAlphaComponent:", 0.75), 2);
      }
      uint64_t v6 = [(NSMutableArray *)nodeList countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (UIColor)labelColor
{
  return self->labelColor;
}

- (id)nodeAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->nodeList objectAtIndexedSubscript:a3];
}

@end