@interface BlastDoorImage
- (BOOL)writeToURL:(id)a3 usingEncoding:(unint64_t)a4 error:(id *)a5;
- (BlastDoorImage)init;
- (CGImage)cgImage;
- (__CVBuffer)pixelBuffer;
- (id)dataUsingEncoding:(unint64_t)a3 error:(id *)a4;
@end

@implementation BlastDoorImage

- (id)dataUsingEncoding:(unint64_t)a3 error:(id *)a4
{
  v5 = self;
  uint64_t v6 = sub_1B12E395C(a3);
  unint64_t v8 = v7;

  v9 = (void *)sub_1B1969DB0();
  sub_1B11ED78C(v6, v8);
  return v9;
}

- (BOOL)writeToURL:(id)a3 usingEncoding:(unint64_t)a4 error:(id *)a5
{
  uint64_t v7 = sub_1B1969D10();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B1969CA0();
  v11 = self;
  sub_1B12E3AEC((uint64_t)v10, a4);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return 1;
}

- (CGImage)cgImage
{
  v2 = self;
  v3 = (void *)sub_1B12E3D9C();

  return (CGImage *)v3;
}

- (__CVBuffer)pixelBuffer
{
  void (*v6)(id *__return_ptr, id (*)@<X0>(void *@<X0>, void *@<X8>), void, uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  BlastDoorImage *v9;
  id v10;
  id v12;
  uint64_t vars8;

  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR___BlastDoorImage_image);
  uint64_t v4 = v3[3];
  uint64_t v5 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  uint64_t v6 = *(void (**)(id *__return_ptr, id (*)@<X0>(void *@<X0>, void *@<X8>), void, uint64_t, uint64_t, uint64_t))(v5 + 24);
  type metadata accessor for CVBuffer(0);
  uint64_t v8 = v7;
  uint64_t v9 = self;
  v6(&v12, sub_1B12E4188, 0, v8, v4, v5);

  v10 = v12;
  return (__CVBuffer *)v10;
}

- (BlastDoorImage)init
{
  result = (BlastDoorImage *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end