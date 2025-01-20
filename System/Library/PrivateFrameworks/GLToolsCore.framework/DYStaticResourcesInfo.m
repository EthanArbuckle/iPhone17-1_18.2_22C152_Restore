@interface DYStaticResourcesInfo
+ (BOOL)supportsSecureCoding;
- (DYStaticResourcesInfo)initWithCoder:(id)a3;
- (NSArray)buffers;
- (NSArray)framebuffers;
- (NSArray)programPipelines;
- (NSArray)programs;
- (NSArray)queries;
- (NSArray)renderbuffers;
- (NSArray)shaders;
- (NSArray)textures;
- (NSArray)vertexArrays;
- (id)debugDescription;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setBuffers:(id)a3;
- (void)setFramebuffers:(id)a3;
- (void)setProgramPipelines:(id)a3;
- (void)setPrograms:(id)a3;
- (void)setQueries:(id)a3;
- (void)setRenderbuffers:(id)a3;
- (void)setShaders:(id)a3;
- (void)setTextures:(id)a3;
- (void)setVertexArrays:(id)a3;
@end

@implementation DYStaticResourcesInfo

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)DYStaticResourcesInfo;
  [(DYStaticResourcesInfo *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DYStaticResourcesInfo)initWithCoder:(id)a3
{
  v26.receiver = self;
  v26.super_class = (Class)DYStaticResourcesInfo;
  v4 = [(DYStaticResourcesInfo *)&v26 init];
  if (v4)
  {
    v5 = (void *)MEMORY[0x263EFFA08];
    uint64_t v6 = objc_opt_class();
    v4->textures = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), @"textures");
    v7 = (void *)MEMORY[0x263EFFA08];
    uint64_t v8 = objc_opt_class();
    v4->renderbuffers = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0), @"renderbuffers");
    v9 = (void *)MEMORY[0x263EFFA08];
    uint64_t v10 = objc_opt_class();
    v4->framebuffers = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0), @"framebuffers");
    v11 = (void *)MEMORY[0x263EFFA08];
    uint64_t v12 = objc_opt_class();
    v4->buffers = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0), @"buffers");
    v13 = (void *)MEMORY[0x263EFFA08];
    uint64_t v14 = objc_opt_class();
    v4->vertexArrays = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0), @"vertexArrays");
    v15 = (void *)MEMORY[0x263EFFA08];
    uint64_t v16 = objc_opt_class();
    v4->queries = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0), @"queries");
    v17 = (void *)MEMORY[0x263EFFA08];
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    v4->shaders = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v17, "setWithObjects:", v18, v19, objc_opt_class(), 0), @"shaders");
    v20 = (void *)MEMORY[0x263EFFA08];
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    v4->programs = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v20, "setWithObjects:", v21, v22, objc_opt_class(), 0), @"programs");
    v23 = (void *)MEMORY[0x263EFFA08];
    uint64_t v24 = objc_opt_class();
    v4->programPipelines = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0), @"programPipelines");
  }
  return v4;
}

- (id)debugDescription
{
  v3.receiver = self;
  v3.super_class = (Class)DYStaticResourcesInfo;
  return (id)[NSString stringWithFormat:@"%@, %@\n\ttextures = %@\n\trenderbuffers = %@\n\tframebuffers = %@\n\tbuffers = %@\n\tvertexArrays = %@\n\tqueries = %@\n\tshaders = %@\n\tprograms = %@\n\tprogramPipelines = %@", -[DYStaticResourcesInfo debugDescription](&v3, sel_debugDescription), -[DYStaticResourcesInfo description](self, "description"), -[NSArray debugDescription](self->textures, "debugDescription"), -[NSArray debugDescription](self->renderbuffers, "debugDescription"), -[NSArray debugDescription](self->framebuffers, "debugDescription"), -[NSArray debugDescription](self->buffers, "debugDescription"), -[NSArray debugDescription](self->vertexArrays, "debugDescription"), -[NSArray debugDescription](self->queries, "debugDescription"), -[NSArray debugDescription](self->shaders, "debugDescription"), -[NSArray debugDescription](self->programs, "debugDescription"), -[NSArray debugDescription](self->programs, "debugDescription")];
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->textures forKey:@"textures"];
  [a3 encodeObject:self->renderbuffers forKey:@"renderbuffers"];
  [a3 encodeObject:self->framebuffers forKey:@"framebuffers"];
  [a3 encodeObject:self->buffers forKey:@"buffers"];
  [a3 encodeObject:self->vertexArrays forKey:@"vertexArrays"];
  [a3 encodeObject:self->queries forKey:@"queries"];
  [a3 encodeObject:self->shaders forKey:@"shaders"];
  [a3 encodeObject:self->programs forKey:@"programs"];
  programPipelines = self->programPipelines;
  [a3 encodeObject:programPipelines forKey:@"programPipelines"];
}

- (NSArray)textures
{
  return self->textures;
}

- (void)setTextures:(id)a3
{
}

- (NSArray)renderbuffers
{
  return self->renderbuffers;
}

- (void)setRenderbuffers:(id)a3
{
}

- (NSArray)framebuffers
{
  return self->framebuffers;
}

- (void)setFramebuffers:(id)a3
{
}

- (NSArray)buffers
{
  return self->buffers;
}

- (void)setBuffers:(id)a3
{
}

- (NSArray)vertexArrays
{
  return self->vertexArrays;
}

- (void)setVertexArrays:(id)a3
{
}

- (NSArray)queries
{
  return self->queries;
}

- (void)setQueries:(id)a3
{
}

- (NSArray)shaders
{
  return self->shaders;
}

- (void)setShaders:(id)a3
{
}

- (NSArray)programs
{
  return self->programs;
}

- (void)setPrograms:(id)a3
{
}

- (NSArray)programPipelines
{
  return self->programPipelines;
}

- (void)setProgramPipelines:(id)a3
{
}

@end